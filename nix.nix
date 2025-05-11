{ pkgs, ... }:
with pkgs; {
  home.file.".nix-channels".source = ./nix-channels;
  nix = {
    gc = {
      automatic = true;
      frequency = "daily";
      options = "--delete-older-than 20d";
    };
    package = pkgs.nix;
    settings = {
      extra-experimental-features = [
        "nix-command"
        "flakes"
      ];
    };
  };
  nixpkgs.config = {
    permittedInsecurePackages = [
    ];
    allowUnfree = true;
  };
}
