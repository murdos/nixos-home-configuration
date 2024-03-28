{ pkgs, ... }:
with pkgs; {
  programs = {
    java = {
      enable = true;
      package = jdk21.override { enableJavaFX = true; };
    };
    gradle = {
      enable = true;
      settings = {
        "org.gradle.caching" = true;
        "org.gradle.parallel" = true;
      };
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
    dive # A tool for exploring each layer in a docker image
    graphviz
    plantuml
    dotty # = scala3
    sbt
    git-crypt
    maven
    bun
    nodejs
    nodePackages.npm
    nodePackages.pnpm
    yarn
    exercism
    pgcli
    mob
    nixpkgs-fmt
    pre-commit
    otel-desktop-viewer
  ];
}
