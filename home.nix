{ pkgs, ... }:
with pkgs; {
  imports = [
    ./cli.nix
    ./dev.nix
    ./desktop.nix
  ];
  home.stateVersion = "23.05";
  home.username = "amino";
  home.homeDirectory = "/home/amino";

  home.packages = [
    # Nix stuff
    nix-index
    patchelf
    autoPatchelfHook
    any-nix-shell
    appimage-run
  ];
  home.file.".nix-channels".source = ./nix-channels;
  xdg.configFile."nixpkgs/config.nix".source = ./config.nix;
  services.gpg-agent = {
    enable = true;
    defaultCacheTtl = 1800;
    enableSshSupport = true;
    enableExtraSocket = true;
  };
  services.syncthing.enable = true;
  systemd.user.startServices = "sd-switch";
  programs = {
    direnv.nix-direnv.enable = true;
    home-manager.enable = true;
  };
}
