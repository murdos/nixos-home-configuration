{ pkgs, ... }:
with pkgs; {
  programs.ghostty = {
    enable = true;
    installBatSyntax = true;
    installVimSyntax = true;
    settings = {
      theme = "Arthur";
    };
  };
}
