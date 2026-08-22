{ config, pkgs, ... }:
with pkgs;
{
  imports = [
    ./cli.nix
    ./dev.nix
    ./desktop.nix
    ./gaming.nix
    ./nix.nix
    <agenix/modules/age-home.nix>
  ];
  home.stateVersion = "26.05";
  home.username = "amino";
  home.homeDirectory = "/home/${config.home.username}";

  home.packages = [
    # Nix stuff
    nix-index
    nix-tree
    patchelf
    autoPatchelfHook
    any-nix-shell
    appimage-run
    (pkgs.callPackage <agenix/pkgs/agenix.nix> { })
  ];
  age.identityPaths = [ "${config.home.homeDirectory}/.age/personal-key.txt" ];

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
  systemd.user.startServices = "sd-switch";
  programs = {
    home-manager.enable = true;
  };
}
