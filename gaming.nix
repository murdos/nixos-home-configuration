{ pkgs, ... }:
with pkgs; {
  home.packages = [
    steam
    joycond # userspace daemon to combine joy-cons from the hid-nintendo kernel driver
    joycond-cemuhook # support for cemuhook's UDP protocol for joycond devices
  ];
}
