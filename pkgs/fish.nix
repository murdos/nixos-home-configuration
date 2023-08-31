{ pkgs, ...}:
with pkgs; {
  home.packages = [
    fzf
  ];
  programs.fish = {
    enable = true;
    interactiveShellInit = ''
      any-nix-shell fish --info-right | source
    '';
    shellInit = ''
      set NPM_PACKAGES "$HOME/.npm"
      if not test -e $NPM_PACKAGES
        mkdir $NPM_PACKAGES
      end
      set PATH $NPM_PACKAGES/bin $PATH
      set MANPATH $NPM_PACKAGES/share/man $MANPATH
    '';
    shellAbbrs = {
      k = "kubectl";
    };
    shellAliases = {
      cat = "bat";
      vi = "vim";
      top = "gotop";
      du = "du -h";
      df = "df -h";
      gsudo = "sudo git -c \"include.path=$HOME/.config/git/config\"";
    };
    plugins = with pkgs; [
      {
        name = "bobthefisher";
        src = fishPlugins.bobthefisher.src;
      }
      {
        name = "fzf-fish";
        src = fishPlugins.fzf-fish.src;
      }
      {
        name = "z";
        src = fishPlugins.z.src;
      }
      {
        name = "forgit";
        src = fishPlugins.forgit.src;
      }
      {
        name = "puffer";
        src = fishPlugins.puffer.src;
      }
    ];
  };
}
