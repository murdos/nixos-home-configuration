{ pkgs, ...}:
with pkgs; {
  programs = {
    java = {
      enable = true;
      package = jdk17.override { enableJavaFX = true; };
    };
    jq.enable = true;
    k9s.enable = true;
    vscode = {
      enable = true;
      package = vscodium-fhs;
    };
  };
  home.file.".npmrc".source = ./npmrc;
  home.packages = [
    jetbrains.idea-ultimate
    dbeaver
    insomnia
    steam-run-native # to run Cypress or Protractor E2E
    docker-compose
    kubectl
    graphviz
    plantuml
    dotty # = scala3
    sbt
    git-crypt
    maven
    gradle
    bun
    nodejs
    nodePackages.npm
    nodePackages.pnpm
    yarn
    exercism
    pgcli
    mob
  ];
}
