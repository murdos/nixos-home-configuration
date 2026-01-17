{ pkgs, ... }:
with pkgs; {
  home.packages = [
    steam
    heroic # Heroic Games Launcher, an open-source GOG and Epic Games Store client
    nsz
    highscore
    highscore-mednafen
    highscore-mupen64plus
    highscore-bsnes
    ryubing
    joycond # userspace daemon to combine joy-cons from the hid-nintendo kernel driver
    joycond-cemuhook # support for cemuhook's UDP protocol for joycond devices
  ];
}
