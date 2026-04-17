{
  config,
  pkgs,
  lib,
  ...
}: let
  inherit (lib.modules) mkMerge mkIf;

  mapAutostart = {
    pkg,
    desktopFile,
    condition ? true,
  }:
    mkIf condition {
      xdg.configFile."autostart/${desktopFile}".source = "${pkg}/share/applications/${desktopFile}";
    };

  autostarts = [
    {
      pkg = config.programs.firefox.package;
      desktopFile = "firefox.desktop";
      condition = config.programs.firefox.enable;
    }
    {
      pkg = pkgs.synology-drive-client;
      desktopFile = "synology-drive.desktop";
      condition = lib.elem pkgs.synology-drive-client config.home.packages;
    }
    {
      pkg = pkgs.localsend;
      desktopFile = "LocalSend.desktop";
      condition = lib.elem pkgs.localsend config.home.packages;
    }
  ];
in
  mkMerge (map mapAutostart autostarts)
