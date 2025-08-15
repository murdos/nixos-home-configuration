{ pkgs, ... }:
with pkgs; {
  programs.firefox = {
    enable = true;
    package = pkgs.firefox-wayland.override {
      nativeMessagingHosts = [
        pkgs.gnome-browser-connector
        pkgs.fx-cast-bridge
      ];
    };
    languagePacks = [ "fr-FR" "en-US" ];
    profiles."default" = {
      path = "haf6sy71.default";
      isDefault = true;
      settings = {
        "browser.urlbar.clickSelectsAll" = true;
        "browser.tabs.allowTabDetach" = false;
      };
    };
  };
}
