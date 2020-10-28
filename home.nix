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
    calibre
    gimp
    shotwell
    libreoffice
    blueman
    bibata-cursors
    paper-icon-theme
    gnomeExtensions.clipboard-indicator
    gnomeExtensions.sound-output-device-chooser
    gnome3.gnome-boxes
    gnome3.gnome-books
    gnome3.dconf-editor
    gnome3.gnome-documents
    gnome3.gnome-nettool
    gnome3.gnome-power-manager
    gnome3.gnome-tweaks
    gnome3.gnome-usage
    gnome3.vinagre
    picard
    steam
    nextcloud-client
    keepassxc
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
    # Development
    jetbrains.idea-ultimate
    vscode-with-extensions
    dbeaver
    docker-compose
    kube3d
    kubectl
    graphviz
    plantuml
    maven
    adoptopenjdk-bin
    nodejs
    robo3t
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
