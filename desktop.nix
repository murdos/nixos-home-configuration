{ pkgs, ... }:
with pkgs; {
  imports =
    let
      ls = dir: builtins.map (f: (dir + "/${f}")) (builtins.attrNames (builtins.readDir dir));
    in
    ls ./apps/desktop;
  home.packages = [
    chromium
    spotify
    slack
    discord
    element-desktop
    signal-desktop
    picard
    chromaprint
    keepassxc
    protonvpn-gui
    planify
    pdftk # for manipulating pdfs
    xournalpp # for annotating pdfs
    handbrake # for converting videos
    inkscape
    koodo-reader # for reading ebooks
    obsidian
    bitwarden
    synology-drive-client
    pinta # for quick image editing
    vlc
  ];
  programs.foliate.enable = true;
  xsession.numlock.enable = true;
}
