{
  programs.firefox = {
    enable = true;
    enableGnomeExtensions = true;
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
