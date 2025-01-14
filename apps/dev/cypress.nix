{ pkgs, ... }:
with pkgs; {
  home.sessionVariables = {
    CYPRESS_INSTALL_BINARY = "0";
    CYPRESS_RUN_BINARY = "${pkgs.cypress}/bin/Cypress";
  };
  home.packages = [
    cypress
  ];
}
