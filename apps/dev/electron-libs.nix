{ pkgs, ... }:
{
  # Browsers downloaded by npm, run with nix-ld:
  # - Cypress: its Electron (~/.cache/Cypress)
  # - Playwright: Chromium and Firefox (~/.cache/ms-playwright), WebKit is not supported
  #
  # To list the libraries still missing (e.g. after an upgrade), in bash, from the browser directory
  # (~/.cache/Cypress/<version>/Cypress, ~/.cache/ms-playwright/<browser>-<revision>):
  #
  #   find . -type f \( -name '*.so*' -o -perm -u+x \) -exec nix shell nixpkgs#binutils -c readelf -d {} + 2>/dev/null \
  #     | sed -n 's/.*Shared library: \[\(.*\)\]/\1/p' | sort -u \
  #     | grep -vE '^(ld-linux.*|lib(c|m|dl|pthread|resolv|rt)\.so\..*)$' \
  #     | while read -r l; do
  #         [ -n "$(find . -name "$l" -print -quit)" ] && continue
  #         found=; for d in ${NIX_LD_LIBRARY_PATH//:/ }; do [ -e "$d/$l" ] && found=1; done
  #         [ -z "$found" ] && echo "$l"
  #       done
  #
  # (glibc libraries are excluded: nix-ld brings its own glibc)
  #
  # Then find the package of each library, and declare it without its output (cups.lib -> cups):
  #
  #   nix-locate --minimal --whole-name --at-root /lib/libcups.so.2
  #
  # Libraries loaded with dlopen do not appear in readelf: if a browser still fails, run it directly to
  # see the error, e.g. ~/.cache/Cypress/*/Cypress/Cypress --no-sandbox --smoke-test --ping=1
  programs.nix-ld.libraries = with pkgs; [
    alsa-lib
    at-spi2-atk
    at-spi2-core
    atk
    cairo
    cups
    dbus
    expat
    fontconfig
    freetype
    gdk-pixbuf
    glib
    gtk3
    libgbm
    libx11
    libxcb
    libxcomposite
    libxcursor
    libxdamage
    libxext
    libxfixes
    libxi
    libxkbcommon
    libxrandr
    libxrender
    nspr
    nss
    pango
  ];
}
