{
  lib,
  pkgs,
  ...
}: let
  desktop = import ../../lib/desktop-utils.nix { inherit lib pkgs; };
  inherit (lib.modules) mkMerge;

  registerAutostartPackage = pkg:
    let desktopFile = desktop.defaultDesktopFile pkg;
    in {
      xdg.configFile."autostart/${desktopFile}".source = "${pkg}/share/applications/${desktopFile}";
    };

  autostarts = with pkgs; [
    firefox
    synology-drive-client
    localsend
  ];
in
  mkMerge (map registerAutostartPackage autostarts)
