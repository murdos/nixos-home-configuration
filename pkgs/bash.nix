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
        NPM_PACKAGES="${HOME}/.npm-packages"
        export PATH="$PATH:$NPM_PACKAGES/bin"
        # Preserve MANPATH if you already defined it somewhere in your config.
        # Otherwise, fall back to `manpath` so we can inherit from `/etc/manpath`.
        export MANPATH="${MANPATH-$(manpath)}:$NPM_PACKAGES/share/man"
      '';
    };
  };
}
