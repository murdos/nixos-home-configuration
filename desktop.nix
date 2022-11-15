{ pkgs, ...}:
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
    teams
    picard
    chromaprint
    keepassxc
    pdftk
    xournalpp
    p3x-onenote
    inkscape
    tilix
    obsidian
    #logseq
    zoom-us
    #etcher
  ];
}
