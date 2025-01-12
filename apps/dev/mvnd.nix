{ pkgs, ... }:
with pkgs; {
  nixpkgs.overlays = [ (final: prev: { mvnd = prev.callPackage ../../pkgs/mvnd { }; }) ];
  home.packages = [ mvnd ];
}
