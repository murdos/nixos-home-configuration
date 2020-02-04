{
  programs.firefox = {
    enable = true;
    profiles."default" = {
      path = "haf6sy71.default";
      isDefault = true;
      settings = {
        "browser.urlbar.clickSelectsAll" = true;
      };
    };
  };
}
