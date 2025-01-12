{ pkgs, ... }:
with pkgs; {
  imports =
    let
      ls = dir: builtins.map (f: (dir + "/${f}")) (builtins.attrNames (builtins.readDir dir));
    in
    ls ./apps/dev;

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
    k9s.enable = true;
    vscode = {
      enable = true;
      package = vscodium-fhs;
    };
  };

  home.file.".npmrc".source = ./npmrc;

  home.sessionVariables = {
    PLAYWRIGHT_BROWSERS_PATH = "${pkgs.playwright-driver.browsers}";
    PLAYWRIGHT_SKIP_VALIDATE_HOST_REQUIREMENTS = "true";
  };

  home.packages = [
    jetbrains.idea-ultimate
    dbeaver-bin
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
    asdf-vm
    bun
    nodejs
    nodePackages.npm
    nodePackages.pnpm
    yarn
    exercism
    pgcli
    mob
    nixpkgs-fmt
    playwright-driver.browsers
    pre-commit
    otel-desktop-viewer
  ];
}
