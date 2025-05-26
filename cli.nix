{ pkgs, ... }:
with pkgs; {
  imports =
    let
      ls = dir: builtins.map (f: (dir + "/${f}")) (builtins.attrNames (builtins.readDir dir));
    in
    ls ./apps/cli;
  home.packages = [
    bandwhich # shows real-time bandwidth usage per process
    thefuck
    peco
    powerline-fonts
    jetbrains-mono
    cascadia-code
    rlwrap
    srm # secure replacement for rm that overwrites the data in the target files before unlinking them
    htop
    dos2unix
    oha # http load generator with realtime terminal interface
    mkvtoolnix-cli # for manipulating mkv files
    nix-inspect # Interactive TUI for inspecting nix configs and other expressions
    psmisc # small useful utilities that use the proc filesystem (such as fuser, killall and pstree)
    gron # Make JSON greppable by transforming it into discrete assignments
    xh # Friendly and fast tool for sending HTTP requests (like httpie with a focus on improved performance)
    procs # Modern replacement for ps
    gdu # Disk usage analyzer with console interface
    tldr # Simplified and community-driven man pages with practical examples
    jless # command-line pager for JSON data
    visidata # interactive multitool for tabular data
    yq # jq wrapper for YAML, XML, TOML documents
  ];

  home.shell.enableShellIntegration = true;

  home.shellAliases = {
    ls = "eza --git --header";
    cat = "bat";
    vi = "vim";
    top = "btop";
    http = "xh";
    du = "du -h";
    df = "df -h";
    man = "batman";
    grep = "batgrep";
    gsudo = "sudo git -c \"include.path=$HOME/.config/git/config\"";
  };

  programs = {
    atuin = { # improved shell history
      enable = true;
      flags = [ "--disable-up-arrow" ];
      settings = {
        search_mode = "skim";
      };
    };
    bat = {
      enable = true;
      extraPackages = with pkgs.bat-extras; [ batman batgrep ];
    };
    btop.enable = true;
    direnv = {
      enable = true;
      nix-direnv = {
        enable = true;
      };
    };
    eza.enable = true;
    fd.enable = true; # Simple, fast and user-friendly alternative to find
    ripgrep.enable = true;
    jq.enable = true;
    fzf.enable = true;
    helix = {
      enable = true;
      settings = {
        theme = "Monokai";
      };
    };
    yazi = {
      enable = true;
    };
    zoxide = {
      enable = true;
      options = [ "--cmd cd" ];
    };
  };
}
