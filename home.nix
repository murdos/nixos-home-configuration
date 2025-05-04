{ pkgs, ... }:
with pkgs; {
  imports = [
    ./cli.nix
    ./dev.nix
    ./desktop.nix
    ./gaming.nix
    ./nix.nix
  ];
  home.stateVersion = "24.11";
  home.username = "amino";
  home.homeDirectory = "/home/amino";

  home.packages = [
    # Nix stuff
    nix-index
    nix-tree
    patchelf
    autoPatchelfHook
    any-nix-shell
    appimage-run
  ];
  services.gpg-agent = {
    enable = true;
    defaultCacheTtl = 1800;
    enableSshSupport = true;
    enableExtraSocket = true;
    pinentry.package = pkgs.pinentry-gnome3;
  };
  services.home-manager.autoUpgrade = {
    enable = true;
    frequency = "12:30";
  };
  services.syncthing.enable = true;
  systemd.user.startServices = "sd-switch";
  programs = {
    home-manager.enable = true;
  };
}
