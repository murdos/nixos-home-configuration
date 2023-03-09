{ pkgs, ...}:
let
  pkgsUnstable = import <nixpkgs-unstable> {};
in
with pkgs; {
  programs = {
    java = {
      enable = true;
      package = jdk; # 17
    };
    jq.enable = true;
  };
  home.packages = [
    pkgsUnstable.jetbrains.idea-ultimate
    vscodium-fhs
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
    nodejs
    nodePackages.npm
    nodePackages.pnpm
    yarn
    exercism
    pgcli
  ];
}
