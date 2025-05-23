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
  };

  home.packages = [
    jetbrains.idea-ultimate
    jetbrains.gateway
    maven
    mvnd
    async-profiler
  ];

  home.shellAliases = {
    asprof = "async-profiler";
  };
}
