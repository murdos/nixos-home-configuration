{
  # TODO :
  # to install  omf :
  # curl -L --insecure https://get.oh-my.fish > install
  # fish install --noninteractive
  # checkout git@github.com:FaustXVI/omf-config in .config/omf
  # run omf install
  xdg.configFile."fish/functions/fish_user_key_bindings.fish".source = ./key_bindings.fish;

  programs.fish = {
    enable = true;
    promptInit = ''
      any-nix-shell fish --info-right | source
    '';
    shellInit = ''
      set NPM_PACKAGES "$HOME/.npm-packages"
      if not test -e $NPM_PACKAGES 
        mkdir $NPM_PACKAGES 
      end
      set PATH $NPM_PACKAGES/bin $PATH
      set MANPATH $NPM_PACKAGES/share/man $MANPATH
    '';
    shellAliases = {
      cat = "bat";
      vi = "vim";
    };
  };
}
