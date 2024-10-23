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
    PLAYWRIGHT_BROWSERS_PATH = "${pkgs.playwright-driver.browsers}";
    PLAYWRIGHT_SKIP_VALIDATE_HOST_REQUIREMENTS = "true";
  };

  nixpkgs.overlays = [
    (self: super: {
      # https://github.com/NixOS/nixpkgs/pull/258854
      cypress = (import
        (builtins.fetchTarball {
          url =
            "https://github.com/r-ryantm/nixpkgs/archive/6943b0b54ca5c8c7f53c4512761bcc1ad8c611ae.tar.gz";
          sha256 = "0x73nzc68q56gbncfxbcaq3karghv63ps5ik855gsvcd9kc6s1a6";
        })
        { }).cypress;
    })
  ];

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
