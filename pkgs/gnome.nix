{ pkgs, ...}:
with pkgs; {
  home.packages = [
      bibata-cursors
      paper-icon-theme
      gnomeExtensions.clipboard-indicator
      gnomeExtensions.sound-output-device-chooser
      gnomeExtensions.openweather
      gnomeExtensions.auto-move-windows
      gnomeExtensions.places-status-indicator
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
      cursor-theme = "Bibata_Amber";
      clock-show-weekday = true;
      show-battery-percentage = true;
    };
    "org/gnome/desktop/peripherals/touchpad" = {
      tap-to-click = true;
      two-finger-scrolling-enabled = true;
    };
    # Shell extensions
    "org/gnome/shell".enabled-extensions = [
      gnomeExtensions.clipboard-indicator.extensionUuid
      gnomeExtensions.openweather.extensionUuid
      gnomeExtensions.places-status-indicator.extensionUuid
      gnomeExtensions.auto-move-windows.extensionUuid
      gnomeExtensions.workspace-indicator.extensionUuid
    ];
    "org/gnome/shell/extensions/auto-move-windows" = {
      application-list = [
        "spotify.desktop:2"
        "slack.desktop:2"
      ];
    };
    "org/gnome/shell/extensions/openweather" = {
      city = "45.7578137,4.8320114>Lyon>-1";
      decimal-places = 0;
      geolocation-provider = "openstreetmaps";
    };
  };

  gtk = {
    enable = true;
    iconTheme = {
      package = paper-icon-theme;
      name = "Paper";
    };
  };

  programs.gnome-terminal = {
    enable = true;
    showMenubar = false;
    profile = {
      "b1dcc9dd-5262-4d8d-a863-c897e6d979b9" = {
        default = true;
        visibleName = "Unamed";
        showScrollbar = false;
        cursorShape = "block";
        colors = {
          foregroundColor = "rgb(211,215,207)";
          backgroundColor = "rgb(46,52,54)";
          palette = [
            "rgb(0,0,0)" "rgb(145,34,38)"
            "rgb(119,137,0)" "rgb(174,123,0)"
            "rgb(103,123,192)" "rgb(104,42,155)"
            "rgb(43,102,81)" "rgb(146,149,147)"
            "rgb(102,102,102)" "rgb(204,102,102)"
            "rgb(181,189,104)" "rgb(240,198,116)"
            "rgb(140,152,191)" "rgb(178,148,187)"
            "rgb(138,190,183)" "rgb(236,235,236)"
          ];
        };
      };
    };
  };
}
