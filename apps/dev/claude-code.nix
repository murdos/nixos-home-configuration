{
  pkgs,
  lib,
  config,
  ...
}:
with pkgs;
{

  programs.claude-code = {
    enable = true;

    settings = {
      theme = "dark";
      tui = "fullscreen";
      autoUpdates = false;
      includeCoAuthoredBy = false;
      # Don't add link "Claude-Session: https://claude.ai/code/..." to commits and PR
      attribution = {
        sessionUrl = false;
      };
      autoCompactEnabled = true;
      enableAllProjectMcpServers = false;
      outputStyle = "Explanatory";
      context = ''
        I am a senior software engineer with a strong Java background. My system runs NixOS and I manage my personal profile with home-manager.
        Any software change to the system (installing, removing, or configuring packages, services, or dotfiles) must be made declaratively through one of these two configs, never with ad-hoc imperative commands:
        - /etc/nixos — system-wide NixOS configuration
        - ~/.config/home-manager — user-level home-manager configuration
        After editing, apply changes with `nixos-rebuild switch` (system) or `home-manager switch` (user), as appropriate.
      '';
      permissions = {
        deny = [
          "Bash(rm -rf /*)"
          "Bash(rm -rf /)"
          "Bash(sudo *)"
          "Bash(chmod *)"
          "Bash(dd if=:*)"
          "Bash(mkfs.:*)"
          "Bash(fdisk *)"
          "Bash(format *)"
          "Bash(shutdown *)"
          "Bash(reboot *)"
          "Bash(halt *)"
          "Bash(poweroff *)"
          "Bash(killall *)"
          "Bash(pkill *)"
          "Bash(nc -l -:*)"
          "Bash(ncat -l -:*)"
          "Bash(netcat -l -:*)"
          "Bash(git -C *)"
          "Bash(git add .)"
          "Bash(git push -:*)"
          "Bash(git status --untracked-files=no -:*)"
        ];
        allow = [
          "Bash(git log *)"
          "Bash(git diff *)"
          "Bash(git show *)"
          "Bash(git status --short --untracked-files)"
          "Bash(git add .*)"
          "Bash(git commit -m *)"
          "Bash(docker ps :*)"
          "Bash(docker compose ps :*)"
          "Bash(gh pr view *)"
          "Bash(gh run view *)"
        ];
      };

      hooks = {
        Notification = [
          {
            hooks = [
              {
                type = "command";
                command = "${pkgs.pipewire}/bin/pw-play ${pkgs.sound-theme-freedesktop}/share/sounds/freedesktop/stereo/message-new-instant.oga 2>/dev/null || true";
                async = true;
              }
            ];
          }
        ];
      };
    };

    plugins = [
    ];

    lspServers = {
      nix = {
        command = lib.getExe pkgs.nixd;
        extensionToLanguage = {
          ".nix" = "nix";
        };
      };
      typescript = {
        command = lib.getExe pkgs.typescript-language-server;
        args = [ "--stdio" ];
        extensionToLanguage = {
          ".ts" = "typescript";
          ".tsx" = "typescriptreact";
          ".js" = "javascript";
          ".jsx" = "javascriptreact";
        };
      };
      yaml = {
        command = lib.getExe pkgs.yaml-language-server;
        args = [ "--stdio" ];
        extensionToLanguage = {
          ".yaml" = "yaml";
          ".yml" = "yaml";
        };
      };
    };
  };

  home.packages = [
    gh # GitHub CLI
  ];
}
