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
    bat
    #ripgrep
    ripgrep-all
    gron
    httpie
    gdu
    fd
    exa
    duf
    #tldr
    fasd
    diff-so-fancy
    #fzf
    tig
  ];
}
