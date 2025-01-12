{ pkgs, ... }:
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
      # npm integration
      set NPM_PACKAGES "$HOME/.npm"
      if not test -e $NPM_PACKAGES
        mkdir $NPM_PACKAGES
      end
      set PATH $NPM_PACKAGES/bin $PATH
      set MANPATH $NPM_PACKAGES/share/man $MANPATH

      # asdf integration
      source ${pkgs.asdf-vm}/share/asdf-vm/asdf.fish
    '';
    shellAbbrs = {
      k = "kubectl";
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
