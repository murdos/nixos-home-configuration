{ system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
in
rec {
	xadet-i3-config = import ./i3 {
		inherit (pkgs) stdenv;
	};

	xadet-nix-home = import ./nix-home {
		inherit (pkgs) stdenv;
	};

	xadet-bash = import ./bash {
		inherit (pkgs) stdenv;
	};

	xadet-ssh = import ./ssh {
		inherit (pkgs) stdenv gnupg;
		inherit (builtins) getEnv;
	};

	xadet-gpg = import ./gpg {
		inherit (pkgs) stdenv gnupg;
		inherit (builtins) getEnv;
	};

	xadet-gitconfig = import ./git {
		inherit (pkgs) stdenv;
	};
}