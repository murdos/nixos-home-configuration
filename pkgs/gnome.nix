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
      gnomeExtensions.appindicator
      gnomeExtensions.auto-move-windows
      gnomeExtensions.clipboard-indicator
      gnomeExtensions.openweather
      gnomeExtensions.places-status-indicator
      gnomeExtensions.spotify-tray
      gnomeExtensions.user-themes
      gnomeExtensions.window-list
      gnomeExtensions.workspace-indicator
      gnomeExtensions.syncthing-icon
  ];

  # Startup applications
  home.file.".config/autostart/firefox.desktop".source = "${pkgs.firefox}/share/applications/firefox.desktop";
  home.file.".config/autostart/org.gnome.Console.desktop".source = "${pkgs.gnome-console}/share/applications/org.gnome.Console.desktop";

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
    "org/gnome/nautilus/preferences" = {
      default-folder-viewer = "list-view";
    };
    "org/gnome/settings-daemon/plugins/media-keys" = {
      volume-down = [ "<Primary><Super>Down" ];
      volume-up = [ "<Primary><Super>Up" ];
    };
    # Shell extensions
    "org/gnome/shell".enabled-extensions = [
      gnomeExtensions.appindicator.extensionUuid
      gnomeExtensions.auto-move-windows.extensionUuid
      gnomeExtensions.clipboard-indicator.extensionUuid
      gnomeExtensions.openweather.extensionUuid
      gnomeExtensions.places-status-indicator.extensionUuid
      gnomeExtensions.spotify-tray.extensionUuid
      gnomeExtensions.user-themes.extensionUuid
      gnomeExtensions.window-list.extensionUuid
      gnomeExtensions.syncthing-icon.extensionUuid
    ];
    "org/gnome/shell/extensions/auto-move-windows" = {
      application-list = [
        "spotify.desktop:2"
      ];
    };
    "org/gnome/shell/extensions/window-list" = {
      show-on-all-monitors = true;
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
}
