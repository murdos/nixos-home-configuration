{ pkgs, ...}:
let
  pkgsUnstable = import <nixpkgs-unstable> {};
in
with pkgs; {
  imports = [
    ./pkgs
  ];
  home.stateVersion = "21.05";
  home.username = "amino";
  home.homeDirectory = "/home/amino";

  home.packages = [
    # Gnome
    bibata-cursors
    paper-icon-theme
    gnomeExtensions.clipboard-indicator
    gnomeExtensions.sound-output-device-chooser
    # Desktop apps
    google-chrome
    spotify
    slack
    simplescreenrecorder
    picard
    chromaprint
    steam
    nextcloud-client
    keepassxc
    pdftk
    # CLI
    thefuck
    peco
    powerline-fonts
    rlwrap
    srm
    htop
    dos2unix
    # Nix stuff
    nix-index
    patchelf
    autoPatchelfHook
    any-nix-shell
    steam-run-native
    # Development
    pkgsUnstable.jetbrains.idea-ultimate
    vscode-with-extensions
    dbeaver
    docker-compose
    kubectl
    graphviz
    plantuml
    maven
    jdk11
    nodejs
    jq
    exercism
  ];
  home.file.".nix-channels".source = ./nix-channels;
  services.gpg-agent = {
    enable = true;
    defaultCacheTtl = 1800;
    enableSshSupport = true;
    enableExtraSocket = true;
  };
  programs = {
    home-manager.enable = true;
  };
}
