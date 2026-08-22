{ pkgs, lib, ... }:
let
  # Small C extension used by Lunii.QT to (de/en)crypt story packs.
  # Not packaged in nixpkgs, so we build it ourselves from PyPI.
  xxtea = pkgs.python3Packages.buildPythonPackage rec {
    pname = "xxtea";
    version = "3.6.0";
    pyproject = true;

    src = pkgs.fetchPypi {
      inherit pname version;
      hash = "sha256-Rgc0qPU88VjD0eA83HnwCAkvR5McoDhVuXgWXA99sH4=";
    };

    build-system = [ pkgs.python3Packages.setuptools ];
  };

  lunii-qt = pkgs.python3Packages.buildPythonApplication rec {
    pname = "lunii-qt";
    version = "3.1.4";
    pyproject = false;

    src = pkgs.fetchFromGitHub {
      owner = "o-daneel";
      repo = "Lunii.QT";
      tag = "v${version}";
      hash = "sha256-xSDpXA/hK6mtQXKO0X2eM8kwt7TPQe1ZcTc/cLXihrg=";
    };

    dependencies = with pkgs.python3Packages; [
      pyside6
      psutil
      py7zr
      pycryptodome
      pillow
      mutagen
      ffmpeg-python
      unidecode
      requests
      xxtea
    ];

    nativeBuildInputs = [
      pkgs.qt6.wrapQtAppsHook
      pkgs.wrapGAppsHook3
    ];
    buildInputs = [
      pkgs.qt6.qtbase
      pkgs.qt6.qtwayland
    ];

    dontBuild = true;

    # Upstream bug: mp3_tag_cleanup() writes audio bytes to a
    # NamedTemporaryFile then immediately reopens it *by path* via mutagen,
    # without ever flushing the first handle. For audio smaller than
    # Python's internal write buffer (~8 KiB) the bytes are still sitting
    # in that buffer when mutagen reopens the file, so it sees an empty/
    # truncated file and raises "can't sync to MPEG frame". Patch in an
    # explicit flush() until upstream fixes it.
    postPatch = ''
      substituteInPlace pkg/api/convert_audio.py \
        --replace-fail 'temp_file.write(audio_data)' $'temp_file.write(audio_data)\n        temp_file.flush()'
    '';

    # Upstream only ships a flat script (`lunii-qt.py`) plus a local `pkg/`
    # package and a pre-compiled Qt resource module (`resources_rc.py`,
    # which embeds all icons/translations) -- there is no setup.py/pyproject
    # to build a wheel from, so we lay the tree out ourselves and let
    # buildPythonApplication's wrapper pick up the `#!/usr/bin/env python3`
    # shebang and wire in the PYTHONPATH for `dependencies`.
    installPhase = ''
      runHook preInstall

      mkdir -p $out/lib/lunii-qt
      cp -r pkg resources_rc.py lunii-qt.py $out/lib/lunii-qt/

      mkdir -p $out/bin
      cat > $out/bin/lunii-qt <<EOF
      #!/usr/bin/env python3
      import sys
      sys.path.insert(0, "$out/lib/lunii-qt")
      import runpy
      runpy.run_path("$out/lib/lunii-qt/lunii-qt.py", run_name="__main__")
      EOF
      chmod +x $out/bin/lunii-qt

      runHook postInstall
    '';

    doCheck = false;

    # wrapGAppsHook3 would re-wrap the already-wrapped entrypoint if left
    # to run on its own (it auto-wraps every executable in $out/bin), so
    # we disable that and reuse the gappsWrapperArgs it still populates
    # (this is what supplies GSettings schemas, e.g. org.gtk.Settings.FileChooser,
    # used by Qt's native file-picker dialog).
    dontWrapGApps = true;

    # wrapQtAppsHook/wrapGAppsHook3 only auto-wrap ELF binaries, so for a
    # Python entrypoint we have to feed their env vars into makeWrapper by hand.
    preFixup = ''
      makeWrapperArgs+=("''${qtWrapperArgs[@]}")
      makeWrapperArgs+=("''${gappsWrapperArgs[@]}")
      makeWrapperArgs+=(--prefix PATH : ${lib.makeBinPath [ pkgs.ffmpeg ]})
    '';

    meta = {
      description = "GUI to manage Lunii/Flam storyteller devices";
      homepage = "https://github.com/o-daneel/Lunii.QT";
      changelog = "https://github.com/o-daneel/Lunii.QT/releases/tag/v${version}";
      license = lib.licenses.gpl3Only;
      platforms = lib.platforms.linux;
      mainProgram = "lunii-qt";
    };
  };
in
{
  home.packages = [ lunii-qt ];
}
