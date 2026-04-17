{ pkgs, ... }:
with pkgs;
{
  programs.zed-editor = {
    enable = true;
    extensions = [
      "java"
      "material-icon-theme"
      "nix"
      "proto"
    ];
    extraPackages = [
      nixd
    ];
    userSettings = {
      base_keymap = "JetBrains";
      icon_theme = {
        mode = "dark";
        light = "Zed (Default)";
        dark = "Material Icon Theme";
      };
      theme = {
        mode = "dark";
        light = "One Light";
        dark = "One Dark";
      };
    };
  };
}
