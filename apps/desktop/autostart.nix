{
  lib,
  pkgs,
  ...
}: let
  inherit (lib.modules) mkMerge;

  mapAutostart = {
    pkg,
    desktopFile,
  }: {
    xdg.configFile."autostart/${desktopFile}".source = "${pkg}/share/applications/${desktopFile}";
  };

  autostarts = [
    {
      pkg = pkgs.firefox;
      desktopFile = "firefox.desktop";
    }
  ];
in
  mkMerge (map mapAutostart autostarts)
