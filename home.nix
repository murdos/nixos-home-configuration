{ pkgs, ...}:
with pkgs; {
  imports = [
    ./pkgs
  ];
  home.packages = [
    google-chrome
    thefuck
    peco
    powerline-fonts
    jetbrains.idea-ultimate
    nix-index
    rlwrap
    spotify
    slack
    xpdf
    vlc
    feh
    simplescreenrecorder
    gimp
    shotwell
    docker-compose
    blueman
    libreoffice
    patchelf
    autoPatchelfHook
    srm
    vscode-with-extensions
    arc-theme
    arc-icon-theme
    paper-gtk-theme
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
    plantuml
    keepassxc
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
