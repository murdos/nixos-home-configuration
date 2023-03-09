{ pkgs, ...}:
let
  pkgsUnstable = import <nixpkgs-unstable> {};
in
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
    pkgsUnstable.teams-for-linux
    picard
    chromaprint
    keepassxc
    pdftk
    xournalpp
    p3x-onenote
    inkscape
    tilix
    obsidian
    bitwarden
    #logseq
    zoom-us
    #etcher
  ];
  xsession.numlock.enable = true;
}
