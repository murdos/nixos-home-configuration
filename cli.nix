{ pkgs, ... }:
with pkgs; {
  imports =
    let
      ls = dir: builtins.map (f: (dir + "/${f}")) (builtins.attrNames (builtins.readDir dir));
    in
    ls ./apps/cli;
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
    oha # http load generator with realtime terminal interface
    mkvtoolnix-cli # for manipulating mkv files
    nix-inspect # Interactive TUI for inspecting nix configs and other expressions
    psmisc # small useful utilities that use the proc filesystem (such as fuser, killall and pstree)
    gron # Make JSON greppable by transforming it into discrete assignments
    xh # Friendly and fast tool for sending HTTP requests (like httpie with a focus on improved performance)
    procs # Modern replacement for ps
    gdu # Disk usage analyzer with console interface
    fd # Simple, fast and user-friendly alternative to find
    tldr # Simplified and community-driven man pages with practical examples
    jless # command-line pager for JSON data
    visidata # interactive multitool for tabular data
    yq # jq wrapper for YAML, XML, TOML documents
  ];

  home.shellAliases = {
    ls = "eza --git --header";
    cat = "bat";
    vi = "vim";
    top = "gotop";
    http = "xh";
    du = "du -h";
    df = "df -h";
    gsudo = "sudo git -c \"include.path=$HOME/.config/git/config\"";
  };

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
