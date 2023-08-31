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
    teams-for-linux
    picard
    chromaprint
    keepassxc
    pdftk
    xournalpp
    inkscape
    tilix
    obsidian
    bitwarden
    #logseq
    pinta
    #etcher
  ];
  xsession.numlock.enable = true;
}
