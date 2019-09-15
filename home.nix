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
    steam
    nextcloud-client
    plantuml
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
