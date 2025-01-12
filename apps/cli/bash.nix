{
  programs = {
    bash = {
      enable = true;
      shellOptions = [
        "histappend"
        "checkwinsize"
      ];
      initExtra = ''
        NPM_PACKAGES="$HOME/.npm-packages"
        export PATH="$PATH:$NPM_PACKAGES/bin"
      '';
    };
  };
}
