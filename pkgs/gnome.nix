{ pkgs, ... }:
with pkgs; {
  home.packages = [
    gnome-tweaks
    dconf-editor
    # Additional Gtk themes
    yaru-theme
    amber-theme
    arc-theme
    # Cursors
    bibata-cursors
    # Additional icon themes
    tela-icon-theme
    kora-icon-theme
  ];

  programs.gnome-shell = {
    enable = true;
    extensions = [
      { package = gnomeExtensions.appindicator; }
      { package = gnomeExtensions.auto-move-windows; }
      { package = gnomeExtensions.monitor-window-switcher-2; }
      #        { package = gnomeExtensions.no-overview; }
      { package = gnomeExtensions.openweather-refined; }
      { package = gnomeExtensions.places-status-indicator; }
      { package = gnomeExtensions.quake-terminal; }
      { package = gnomeExtensions.system-monitor; }
      { package = gnomeExtensions.tiling-shell; }
      { package = gnomeExtensions.user-themes; }
      { package = gnomeExtensions.window-list; }
    ];
  };

  # Startup applications
  home.file.".config/autostart/firefox.desktop".source = "${pkgs.firefox}/share/applications/firefox.desktop";

  dconf.settings = {
    "org/gnome/shell".favorite-apps = [
      "firefox.desktop"
      "org.gnome.Nautilus.desktop"
      "idea-ultimate.desktop"
      "org.keepassxc.KeePassXC.desktop"
    ];
    "system/locale".region = "fr_FR.UTF-8";
    "org/gnome/desktop/calendar".show-weekdate = true;
    "org/gnome/desktop/interface" = {
      cursor-theme = "Bibata_Tinted";
      clock-show-weekday = true;
      show-battery-percentage = true;
      enable-hot-corners = false;
    };
    "org/gnome/desktop/peripherals/touchpad" = {
      tap-to-click = true;
      two-finger-scrolling-enabled = true;
    };
    "org/gnome/nautilus/preferences" = {
      default-folder-viewer = "list-view";
      show-image-thumbnails = "always";
      show-directory-item-counts = "always";
      recursive-search = "always";
    };
    "org/gtk/gtk4/settings/file-chooser" = {
      sort-directories-first = true;
    };
    "org/gtk/settings/file-chooser" = {
      sort-directories-first = true;
    };
    "org/gnome/mutter" = {
      dynamic-workspaces = true;
      workspaces-only-on-primary = false;
      edge-tiling = true;
    };
    "org/gnome/settings-daemon/plugins/media-keys" = {
      volume-down = [ "<Primary><Super>Down" ];
      volume-up = [ "<Primary><Super>Up" ];
    };
    "org/gnome/shell/extensions/auto-move-windows" = {
      application-list = [
        "spotify.desktop:2"
      ];
    };
    "org/gnome/shell/extensions/quake-terminal" = {
      terminal-id = "org.gnome.Console.desktop";
      render-on-current-monitor = true;
    };
    "org/gnome/shell/extensions/window-list" = {
      show-on-all-monitors = true;
    };
    "org/gnome/shell/extensions/window-app-switcher-on-active-monitor" = {
      as-current-monitor = true;
      ws-current-monitor = true;
    };
    "org/gnome/shell/extensions/openweatherrefined" = {
      locs = "[(0, 'Lyon', 0, '45.7578137,4.8320114')]";
      position-in-panel = "center";
      wind-speed-unit = "m/s";
    };
  };

  gtk = {
    enable = true;
    iconTheme = {
      name = "Paper";
      package = paper-icon-theme;
    };
    theme = {
      name = "Orchis-light";
      package = orchis-theme;
    };
  };

  home.pointerCursor = {
    gtk.enable = true;
    name = "Bibata_Tinted";
    package = bibata-cursors-translucent;
  };
}
