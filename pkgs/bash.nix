{
  programs = {
    bash = {
      enable = true;
      shellAliases = {
        ls = "ls --color=auto";
        ll = "ls -l";
        la = "ls -A";
        l = "ls -CF";
        vi = "vim";
        grep = "grep --color=auto";
        fgrep = "fgrep --color=auto";
        egrep = "egrep --color=auto";
      };
      shellOptions = [
        "histappend"
        "checkwinsize"
      ];
      initExtra = ''
eval "$(direnv hook bash)"
      '';
    };
  };
}
