{ pkgs, ... }:
with pkgs; {
  programs.ghostty = {
    enable = true;
    enableFishIntegration = true;
    installBatSyntax = true;
    installVimSyntax = true;
    settings = {
      theme = "Arthur";
    };
  };
}
