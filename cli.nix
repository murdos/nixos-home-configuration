{ pkgs, ... }:
with pkgs; {
  imports = [
    ./pkgs/bash.nix
    ./pkgs/fish.nix
    ./pkgs/git.nix
    ./pkgs/tmux.nix
    ./pkgs/vim.nix
  ];
  home.packages = [
    thefuck
    peco
    powerline-fonts
    jetbrains-mono
    cascadia-code
    rlwrap
    srm # secure replacement for rm that overwrites the data in the target files before unlinking them
    htop
    gotop
    dos2unix
    psmisc # small useful utilities that use the proc filesystem (such as fuser, killall and pstree)
    gron # Make JSON greppable by transforming it into discrete assignments
    xh # Friendly and fast tool for sending HTTP requests (like httpie with a focus on improved performance)
    gdu # Disk usage analyzer with console interface
    fd # Simple, fast and user-friendly alternative to find
    tldr # Simplified and community-driven man pages with practical examples
    jless # command-line pager for JSON data
    visidata # interactive multitool for tabular data
    yq # jq wrapper for YAML, XML, TOML documents
  ];
  programs = {
    bat.enable = true;
    eza.enable = true;
    ripgrep.enable = true;
    jq.enable = true;
    helix = {
      enable = true;
      settings = {
        theme = "Monokai";
      };
    };
  };
}
