{ pkgs, ...}:
with pkgs; {
  home.packages = [
      gnome.gnome-tweaks
      gnome.dconf-editor
      # Additional Gtk themes
      yaru-theme
      amber-theme
      arc-theme
      # Cursors
      bibata-cursors
      # Additional icon themes
      tela-icon-theme
      kora-icon-theme
      # Extensions
      gnomeExtensions.auto-move-windows
      gnomeExtensions.clipboard-indicator
      gnomeExtensions.openweather
      gnomeExtensions.places-status-indicator
      gnomeExtensions.sound-output-device-chooser
      gnomeExtensions.user-themes
      gnomeExtensions.window-list
      gnomeExtensions.workspace-indicator
  ];

  # Startup applications
  home.file.".config/autostart/firefox.desktop".source = "${pkgs.firefox}/share/applications/firefox.desktop";
  home.file.".config/autostart/spotify.desktop".source = "${pkgs.spotify}/share/applications/spotify.desktop";

  dconf.settings  = {
    "org/gnome/shell".favorite-apps = [
      "firefox.desktop"
      "org.gnome.Terminal.desktop"
      "org.gnome.Nautilus.desktop"
      "idea-ultimate.desktop"
      "org.keepassxc.KeePassXC.desktop"
    ];
    "system/locale".region = "fr_FR.UTF-8";
    "org/gnome/desktop/calendar".show-weekdate = true;
    "org/gnome/desktop/interface" = {
      cursor-theme = "Bibata-Modern-Amber";
      clock-show-weekday = true;
      show-battery-percentage = true;
    };
    "org/gnome/desktop/peripherals/touchpad" = {
      tap-to-click = true;
      two-finger-scrolling-enabled = true;
    };
    # Shell extensions
    "org/gnome/shell".enabled-extensions = [
      gnomeExtensions.auto-move-windows.extensionUuid
      gnomeExtensions.clipboard-indicator.extensionUuid
      gnomeExtensions.openweather.extensionUuid
      gnomeExtensions.places-status-indicator.extensionUuid
      gnomeExtensions.sound-output-device-chooser.extensionUuid
      gnomeExtensions.user-themes.extensionUuid
      gnomeExtensions.window-list.extensionUuid
    ];
    "org/gnome/shell/extensions/auto-move-windows" = {
      application-list = [
        "spotify.desktop:2"
      ];
    };
    "org/gnome/shell/extensions/openweather" = {
      city = "45.7578137,4.8320114>Lyon>-1";
      decimal-places = 0;
      geolocation-provider = "openstreetmaps";
    };
    "org/gnome/shell/extensions/user-theme".name = "Orchis-dark";
  };

  gtk = {
    enable = true;
    iconTheme = {
      name = "Paper";
      package = paper-icon-theme;
    };
    theme = {
      name = "Orchis-light";
      package = orchis;
    };
  };

  home.pointerCursor = {
    gtk.enable = true;
    name = "Bibata-Modern-Amber";
    package = bibata-cursors-translucent;
  };

  programs.gnome-terminal = {
    enable = true;
    showMenubar = false;
    profile = {
      "b1dcc9dd-5262-4d8d-a863-c897e6d979b9" = {
        default = true;
        visibleName = "Custom";
        showScrollbar = false;
        cursorShape = "block";
        colors = {
          foregroundColor = "rgb(211,215,207)";
          backgroundColor = "rgb(46,52,54)";
          palette = [
            "rgb(7,54,66)" "rgb(220,50,47)"
            "rgb(133,153,0)" "rgb(181,137,0)"
            "rgb(38,139,210)" "rgb(211,54,130)"
            "rgb(42,161,152)" "rgb(238,232,213)"
            "rgb(0,43,54)" "rgb(203,75,22)"
            "rgb(88,110,117)" "rgb(101,123,131)"
            "rgb(131,148,150)" "rgb(108,113,196)"
            "rgb(147,161,161)" "rgb(253,246,227)"
          ];
        };
      };
    };
  };
}
