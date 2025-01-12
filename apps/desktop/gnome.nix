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
