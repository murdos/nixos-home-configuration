{ pkgs, ...}:
with pkgs; {
  imports = [
    ./pkgs
  ];
  home.packages = [
    # Desktop
    google-chrome
    spotify
    slack
    vlc
    simplescreenrecorder
    gimp
    shotwell
    libreoffice
    blueman
    bibata-cursors
    paper-icon-theme
    gnome3.gnome-boxes
    gnome3.dconf-editor
    gnome3.gnome-documents
    gnome3.gnome-nettool
    gnome3.gnome-power-manager
    gnome3.gnome-tweaks
    gnome3.gnome-usage
    gnome3.vinagre
    steam
    nextcloud-client
    keepassxc
    # CLI
    thefuck
    peco
    powerline-fonts
    rlwrap
    srm
    # Nix stuff
    nix-index
    patchelf
    autoPatchelfHook
    # Development
    jetbrains.idea-ultimate
    vscode-with-extensions
    docker-compose
    kube3d
    kubectl
    plantuml
    adoptopenjdk-bin
    nodejs
    jq
  ];
  home.file.".nix-channels".source = ./nix-channels;
  services.gpg-agent = {
    enable = true;
    defaultCacheTtl = 1800;
    enableSshSupport = true;
    enableExtraSocket = true;
  };
  programs = {
    fish.enable = true;
    home-manager.enable = true;
    firefox.enable = true;
  };
}
