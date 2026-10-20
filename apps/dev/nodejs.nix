{ pkgs, ... }:
with pkgs;
{
  programs.npm = {
    enable = true;
    settings = {
      prefix = "$HOME/.npm";
    };
  };
  programs.pnpm.enable = true;
  home.sessionPath = [
    "$HOME/.npm/bin"
  ];
  home.packages = [
    bun
    nodejs
    yarn
  ];
}
