{ pkgs, ... }:
with pkgs; {
  imports = [
    ./cli.nix
    ./dev.nix
    ./desktop.nix
    ./gaming.nix
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
  home.file.".nix-channels".source = ./nix-channels;
  nix = {
    package = pkgs.nix;
    settings = {
      extra-experimental-features = [
        "nix-command"
        "flakes"
      ];
    };
  };
  nixpkgs.config = {
    permittedInsecurePackages = [
    ];
    allowUnfree = true;
  };
  services.gpg-agent = {
    enable = true;
    defaultCacheTtl = 1800;
    enableSshSupport = true;
    enableExtraSocket = true;
    pinentryPackage = pkgs.pinentry-gnome3;
  };
  services.syncthing.enable = true;
  systemd.user.startServices = "sd-switch";
  programs = {
    direnv.nix-direnv.enable = true;
    home-manager.enable = true;
  };
}
