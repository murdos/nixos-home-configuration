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
            "https://github.com/r-ryantm/nixpkgs/archive/04a75c371c0f39268b59dd28b5b40c5fd39db951.tar.gz";
          sha256 = "1i565l37q0wrm2jiq88p4c36q5kw5di4ja2rlqi4k33hffn7nr67";
        })
        { }).cypress;
    })
  ];
}
