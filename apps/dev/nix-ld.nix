{
  config,
  lib,
  pkgs,
  ...
}:
let
  cfg = config.programs.nix-ld;
  libraries = pkgs.buildEnv {
    name = "nix-ld-user-libraries";
    paths = map lib.getLib cfg.libraries;
    pathsToLink = [ "/lib" ];
    ignoreCollisions = true;
  };
  # The system libraries come first: the variable replaces the one set by programs.nix-ld
  libraryPath = "/run/current-system/sw/share/nix-ld/lib:${libraries}/lib";
in
{
  # Same option as programs.nix-ld.libraries in NixOS: home-manager has no nix-ld module
  options.programs.nix-ld.libraries = lib.mkOption {
    type = lib.types.listOf lib.types.package;
    default = [ ];
    description = "Libraries made available to the non-Nix binaries run with nix-ld (programs.nix-ld.enable in NixOS).";
  };

  config = lib.mkIf (cfg.libraries != [ ]) {
    home.sessionVariables.NIX_LD_LIBRARY_PATH = libraryPath;
    systemd.user.sessionVariables.NIX_LD_LIBRARY_PATH = libraryPath;
  };
}
