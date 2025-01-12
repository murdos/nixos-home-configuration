{ pkgs, ... }:
with pkgs; {
  home.sessionVariables = {
    CYPRESS_INSTALL_BINARY = "1";
    CYPRESS_RUN_BINARY = "${pkgs.cypress}/bin/Cypress";
  };
  home.packages = [
    cypress
  ];
}
