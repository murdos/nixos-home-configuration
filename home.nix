{ pkgs, ...}:
let
  pkgsUnstable = import <nixpkgs-unstable> {};
in
with pkgs; {
  imports = [
    ./cli.nix
    ./dev.nix
    ./desktop.nix
  ];
  home.stateVersion = "22.11";
  home.username = "amino";
  home.homeDirectory = "/home/amino";

  home.packages = [
    # Nix stuff
    nix-index
    patchelf
    autoPatchelfHook
    any-nix-shell
    steam-run-native
    appimage-run
  ];
  home.file.".nix-channels".source = ./nix-channels;
  services.gpg-agent = {
    enable = true;
    defaultCacheTtl = 1800;
    enableSshSupport = true;
    enableExtraSocket = true;
  };
  services.syncthing.enable = true;
  systemd.user.startServices = "sd-switch";
  programs = {
    home-manager.enable = true;
  };
}
