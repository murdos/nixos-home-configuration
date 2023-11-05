{ pkgs, ... }:
with pkgs; {
  imports = [
    ./pkgs/firefox.nix
    ./pkgs/gnome.nix
  ];
  home.packages = [
    chromium
    spotify
    slack
    discord
    teams-for-linux
    picard
    chromaprint
    keepassxc
    protonvpn-gui
    pdftk
    xournalpp
    inkscape
    tilix
    obsidian
    bitwarden
    pinta
  ];
  xsession.numlock.enable = true;
}
