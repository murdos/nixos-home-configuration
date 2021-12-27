# home(-manager) configuration

 * Clone this repo in .config/nixpkgs
 * run `nix-channel --add https://github.com/nix-community/home-manager/archive/master.tar.gz home-manager`
 * run `nix-channel --update`
 * run `nix-shell '<home-manager>' -A install`
 * run `home-manager switch`
