{ pkgs, ... }:
with pkgs; {
  home.file.".npmrc".text = ''
    prefix = ''${HOME}/.npm
  '';
  home.sessionPath = [
    "$HOME/.npm/bin"
  ];
  home.packages = [
    bun
    nodejs
    nodePackages.npm
    nodePackages.pnpm
    yarn
  ];
}
