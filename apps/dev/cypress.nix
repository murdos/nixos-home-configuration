{ pkgs, ... }:
with pkgs;
{
  home.sessionVariables = {
    CYPRESS_INSTALL_BINARY = "0";
    CYPRESS_RUN_BINARY = "${pkgs.cypress}/bin/cypress";
  };

  nixpkgs.overlays = [
    (self: super: {
      # https://github.com/NixOS/nixpkgs/pull/437895
      cypress = (import
        (builtins.fetchTarball {
          url =
            "https://github.com/r-ryantm/nixpkgs/archive/622a8ed3e57e4ac58f8f7cffae4afb7dd06d7f35.tar.gz";
          sha256 = "0blxqjczhgzkqydnzasrbc575zfd1ijyy2816ay22h5ysg16rxnp";
        })
        { }).cypress;
    })
  ];
}
