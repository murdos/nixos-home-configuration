{
  programs.git = {
    enable = true;
    settings = {
      user.name = "Aurélien Mino";
      user.email = "aurelien.mino@gmail.com";
      alias = {
        co = "checkout";
        ci = "commit";
        st = "status";
        br = "branch";
        branch-clean = "!git branch --merged | grep -v master | xargs -n 1 git branch -d";
        next = "!git checkout `git rev-list HEAD..demo-end | tail -1`";
      };
      credential.helper = "cache --timeout 3600";
      init.defaultBranch = "main";
      push.default = "current";
      pull.rebase = "merges";
    };
    includes = [{
      condition = "gitdir:~/git/enedis-*/";
      contents = {
        user.email = "aurelien-externe.mino@enedis.fr";
      };
    }];
  };

  programs.delta = {
    enable = true;
    options = {
      line-numbers = true;
    };
    enableGitIntegration = true;
  };
}
