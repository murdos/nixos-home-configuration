{ pkgs, ... }:
with pkgs; {
  programs.gnome-shell = {
    enable = true;
    extensions = [
      { package = gnomeExtensions.appindicator; }
      { package = gnomeExtensions.auto-move-windows; }
      { package = gnomeExtensions.openweather-refined; }
      { package = gnomeExtensions.places-status-indicator; }
      { package = gnomeExtensions.quake-terminal; }
      { package = gnomeExtensions.system-monitor; }
      { package = gnomeExtensions.tiling-shell; }
      { package = gnomeExtensions.user-themes; }
      { package = gnomeExtensions.window-list; }
    ];
  };

  dconf.settings = {
    "org/gnome/shell/extensions/auto-move-windows" = {
      application-list = [
        "spotify.desktop:2"
      ];
    };
    "org/gnome/shell/extensions/quake-terminal" = {
      animation-time = 150;
      terminal-id = "com.mitchellh.ghostty.desktop";
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
}
