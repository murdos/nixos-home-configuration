{ pkgs, ...}:
with pkgs; {
imports = [
    ./pkgs/bash.nix
    ./pkgs/fish.nix
    ./pkgs/git.nix
    ./pkgs/tmux.nix
    ./pkgs/vim.nix
  ];
  home.packages = [
    # CLI
    thefuck
    peco
    powerline-fonts
    jetbrains-mono
    cascadia-code
    rlwrap
    srm
    htop
    dos2unix
    psmisc
    gron
    httpie
    gdu
    fd
    ncdu
    #tldr
    fasd
    diff-so-fancy
    #fzf
    tig
    gotop
  ];
  programs = {
    bat.enable = true;
    eza.enable = true;
    ripgrep.enable = true;
    helix = {
      enable = true;
      settings = {
        theme = "Monokai";
      };
    };
  };
}
