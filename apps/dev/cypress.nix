{ pkgs, ... }:
with pkgs; {
  home.sessionVariables = {
    CYPRESS_INSTALL_BINARY = "1";
    CYPRESS_RUN_BINARY = "${pkgs.cypress}/bin/Cypress";
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
}
