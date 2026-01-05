{ lib, pkgs, ... }:

let
  desktopFiles = pkg:
    let
      appsDir = "${pkg}/share/applications";
    in
      builtins.filter (f: lib.hasSuffix ".desktop" f)
        (builtins.attrNames (builtins.readDir appsDir));
in
{
  inherit desktopFiles;

  defaultDesktopFile = pkg:
    let files = desktopFiles pkg;
    in if files == [] || builtins.length files != 1
       then null
       else builtins.head files;
}
