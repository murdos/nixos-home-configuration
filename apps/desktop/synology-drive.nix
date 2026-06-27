{ pkgs, lib, ... }:
with pkgs;
{
  home.packages = [
    synology-drive-client
  ];
  home.activation.synologyDriveRefresh = lib.hm.dag.entryAfter [ "writeBoundary" ] ''
    SYNOLOGY_APP_DIR="$HOME/.SynologyDrive/SynologyDrive.app"
    CURRENT_NIX_PATH="${pkgs.synology-drive-client}"
    HASH_MARKER="$HOME/.SynologyDrive/.installed-nix-path"

    if [ -d "$SYNOLOGY_APP_DIR" ]; then
      STORED_PATH=""
      if [ -f "$HASH_MARKER" ]; then
        STORED_PATH=$(cat "$HASH_MARKER")
      fi
      if [ "$STORED_PATH" != "$CURRENT_NIX_PATH" ]; then
        echo "Synology Drive: stale app directory detected (Nix hash changed), clearing..."
        rm -rf "$SYNOLOGY_APP_DIR"
      fi
    fi

    mkdir -p "$(dirname "$HASH_MARKER")"
    echo "$CURRENT_NIX_PATH" > "$HASH_MARKER"
  '';
}
