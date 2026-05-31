{ pkgs, ... }:
with pkgs;
{
  programs.gnome-shell = {
    enable = true;
    extensions = [
      { package = gnomeExtensions.appindicator; }
      { package = gnomeExtensions.auto-move-windows; }
      { package = gnomeExtensions.simpleweather; }
      { package = gnomeExtensions.places-status-indicator; }
      { package = gnomeExtensions.quake-terminal; }
      { package = gnomeExtensions.system-monitor; }
      { package = gnomeExtensions.tiling-shell; }
      { package = gnomeExtensions.user-themes; }
      { package = gnomeExtensions.window-list; }
      { package = gnomeExtensions.paperwm; }
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
    "org/gnome/shell/extensions/tilingshell" = {
      inner-gaps = 4;
      outer-gaps = 0;
      enable-autotiling = true;
      show-indicator = true;
      layout-json = ''
        [{"id":"Layout 3","tiles":[{"x":0,"y":0,"width":0.33,"height":1,"groups":[1]},{"x":0.33,"y":0,"width":0.67,"height":1,"groups":[1]}]},{"id":"Layout 4","tiles":[{"x":0,"y":0,"width":0.67,"height":1,"groups":[1]},{"x":0.67,"y":0,"width":0.33,"height":1,"groups":[1]}]},{"id":"26519831","tiles":[{"x":0,"y":0,"width":0.5,"height":1,"groups":[1]},{"x":0.5,"y":0,"width":0.5000000000000078,"height":1,"groups":[1]}]},{"id":"26957275","tiles":[{"x":0,"y":0,"width":1,"height":1,"groups':[]}]}]
      '';
    };
    "org/gnome/shell/extensions/paperwm" = {
      edge-preview-enable = false;
      show-workspace-indicator = false;
      horizontal-margin = 5;
      window-gap = 5;
      vertical-margin = 2;
      vertical-margin-bottom = 2;
    };
    "org/gnome/shell/extensions/paperwm/keybindings" = {
      barf-out = [ "" ];
      barf-out-active = [ "<Super>o" ];
      new-window = [ "<Super>n" ];
    };
    "org/gnome/shell/extensions/window-list" = {
      show-on-all-monitors = true;
    };
    "org/gnome/shell/extensions/window-app-switcher-on-active-monitor" = {
      as-current-monitor = true;
      ws-current-monitor = true;
    };
    "org/gnome/shell/extensions/simple-weather" = {
      is-activated = true;
      panel-box = "center";
      locations = [
        ''{"name":"Villeurbanne","lat":45.77,"lon":4.88}''
      ];
      unit-preset = "metric";
    };
  };
}
