{ pkgs, ...}:
with pkgs; {
  programs.firefox = {
    enable = true;
    package = pkgs.firefox.override {
      # See nixpkgs' firefox/wrapper.nix to check which options you can use
      cfg = {
        enableGnomeExtensions = true;
      };
    };
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
