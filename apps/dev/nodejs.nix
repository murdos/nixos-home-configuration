{ pkgs, ... }:
with pkgs;
{
  programs.npm = {
    enable = true;
    settings = {
      prefix = "$HOME/.npm";
    };
  };
  home.sessionPath = [
    "$HOME/.npm/bin"
  ];
  home.packages = [
    bun
    nodejs
    pnpm
    yarn
  ];
}
