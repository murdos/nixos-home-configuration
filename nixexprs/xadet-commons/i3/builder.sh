source $stdenv/setup

mkdir -p $out/nix-home/_config/i3
chmod -R +rx $out/nix-home/_config
cp $src/config $out/nix-home/_config/i3
cp $src/_background-image $out/nix-home/_background-image
