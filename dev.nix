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
    k9s.enable = true;
    vscode = {
      enable = true;
      package = vscodium-fhs;
    };
  };

  home.file.".npmrc".source = ./npmrc;

  home.sessionVariables = {
    CYPRESS_INSTALL_BINARY = "0";
    CYPRESS_RUN_BINARY = "${pkgs.cypress}/bin/Cypress";
  };

  nixpkgs.overlays = [
    (self: super: {
      # https://github.com/NixOS/nixpkgs/pull/258854
      cypress = (import
        (builtins.fetchTarball {
          url =
            "https://github.com/r-ryantm/nixpkgs/archive/d3b5e6b362b067b816ec39ad104ef9c2a61b9199.tar.gz";
          sha256 = "00rnf863x5gibdn0psyxazjhj6jhgjpx6qg24nbiklh6hvziwbla";
        })
        { }).cypress;
    })
  ];

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
