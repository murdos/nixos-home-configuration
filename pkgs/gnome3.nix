{ pkgs, ...}:
with pkgs; {
  home.packages = [
      bibata-cursors
      paper-icon-theme
      gnomeExtensions.clipboard-indicator
      gnomeExtensions.sound-output-device-chooser
  ];

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
    # Shell extensions
    "org/gnome/shell".enabled-extensions = [
      gnomeExtensions.clipboard-indicator.uuid
      "openweather-extension@jenslody.de"
      "places-menu@gnome-shell-extensions.gcampax.github.com"
      "auto-move-windows@gnome-shell-extensions.gcampax.github.com"
      "workspace-indicator@gnome-shell-extensions.gcampax.github.com"
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
}
