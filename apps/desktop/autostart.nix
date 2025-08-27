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
    {
      pkg = pkgs.synology-drive-client;
      desktopFile = "synology-drive.desktop";
    }
    {
      pkg = pkgs.localsend;
      desktopFile = "LocalSend.desktop";
    }
  ];
in
  mkMerge (map mapAutostart autostarts)
