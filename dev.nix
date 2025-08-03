{ pkgs, ... }:
with pkgs; {
  imports =
    let
      ls = dir: builtins.map (f: (dir + "/${f}")) (builtins.attrNames (builtins.readDir dir));
    in
    ls ./apps/dev;

  programs = {
    k9s.enable = true;
    vscode = {
      enable = true;
      package = vscodium-fhs;
    };
  };

  home.packages = [
    dbeaver-bin
    bruno # git-integrated, fully offline, and open-source API client alternative to Postman
    steam-run-native # to run Cypress or Protractor E2E
    docker-compose
    kubectl
    dive # A tool for exploring each layer in a docker image
    graphviz
    plantuml
    dotty # = scala3
    sbt
    git-crypt
    asdf-vm
    exercism
    pgcli
    mob
    nixpkgs-fmt
    pre-commit
    otel-desktop-viewer
  ];
}
