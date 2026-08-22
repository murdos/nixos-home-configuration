# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## What this repo is

A modular [home-manager](https://github.com/nix-community/home-manager) configuration for a NixOS desktop. It uses traditional **nix channels** (not flakes). The primary user is `amino` (`/home/amino`).

## Key commands

```bash
# Apply all configuration changes
home-manager switch

# Format Nix files (also runs automatically on commit via pre-commit)
nixfmt <file.nix>

# Install/update pre-commit hooks
pre-commit install

# Update nix channels
nix-channel --update

# Rebuild a single package / check syntax without switching
nix-instantiate --eval <file.nix>
```

## Architecture

### Entry point

`home.nix` is the top-level file. It imports the five category modules (`cli.nix`, `dev.nix`, `desktop.nix`, `gaming.nix`, `nix.nix`) and installs a small set of base utilities.

### Category modules

| File | Purpose |
|------|---------|
| `cli.nix` | Shell aliases, CLI tools, program configs (atuin, bat, fzf, zoxide, etc.) |
| `dev.nix` | Dev tools (editors, containers, k8s, databases, language toolchains) |
| `desktop.nix` | GUI apps (Spotify, Signal, browsers, office apps) |
| `gaming.nix` | Steam, Heroic, emulators |
| `nix.nix` | Nix daemon settings, GC, channel symlink |

### `apps/` directory — dynamic auto-import

Each category module uses this pattern to import all `.nix` files in its subdirectory without any manifest:

```nix
imports =
  let
    ls = dir: builtins.map (f: (dir + "/${f}"))
              (builtins.attrNames (builtins.readDir dir));
  in
    ls ./apps/cli;   # or ./apps/dev, ./apps/desktop
```

**To add a new app module**: create `apps/<category>/<name>.nix` — it will be picked up automatically on the next `home-manager switch`.

### Secrets

`agenix` is configured for age-encrypted secrets. Secrets files live outside this repo.

### Channels

`nix-channels` lists the channels in use:
- `nixpkgs` → `nixos-unstable`
- `home-manager` → master
- `agenix` → main

`nix.nix` symlinks this file into the home directory and ensures channels are set on each switch.

## Style conventions

- 2-space indentation, LF line endings (enforced by `.editorconfig`)
- `nixfmt` for formatting (enforced by `.pre-commit-config.yaml`)
- One logical concern per file under `apps/`
- Prefer `programs.<name>.enable = true` and `programs.<name>.settings` over raw `home.packages` when home-manager has a module for the tool
