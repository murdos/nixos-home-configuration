{ pkgs, ... }:
with pkgs; {
  imports = [
    ./cli.nix
    ./dev.nix
    ./desktop.nix
    ./gaming.nix
    ./nix.nix
  ];
  home.stateVersion = "25.05";
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
  services.home-manager = {
    autoExpire = {
      enable = true;
      frequency = "daily";
      store.cleanup = true;
      timestamp = "-20 days";
    };
    autoUpgrade = {
      enable = true;
      frequency = "daily";
    };
  };
  services.syncthing.enable = true;
  systemd.user.startServices = "sd-switch";
  programs = {
    home-manager.enable = true;
  };
}
