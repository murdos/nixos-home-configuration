{ pkgs, ... }:
with pkgs; {
  imports = [
    ./pkgs/firefox.nix
    ./pkgs/gnome.nix
  ];
  home.packages = [
    chromium
    spotify
    slack
    discord
    teams-for-linux
    picard
    chromaprint
    keepassxc
    protonvpn-gui
    pdftk
    xournalpp
    inkscape
    tilix
    obsidian
    bitwarden
    pinta
  ];
  xsession.numlock.enable = true;

  xdg.mimeApps = {
    enable = true;
    defaultApplications = {
      "x-scheme-handler/http" = [ "firefox.desktop" ];
      "x-scheme-handler/https" = [ "firefox.desktop" ];
      "x-scheme-handler" = [ "firefox.desktop" ];
      "text/html" = [ "firefox.desktop" ];
      "application/xhtml+xml" = [ "firefox.desktop" ];
      # Images
      "image/gif" = [ "org.gnome.eog.desktop" ];
      "image/webp" = [ "org.gnome.eog.desktop" ];
      "image/bmp" = [ "org.gnome.eog.desktop" ];
      "image/jpg" = [ "org.gnome.eog.desktop" ];
      "image/pjpeg" = [ "org.gnome.eog.desktop" ];
      "image/png" = [ "org.gnome.eog.desktop" ];
      "image/tiff" = [ "org.gnome.eog.desktop" ];
      "image/x-bmp" = [ "org.gnome.eog.desktop" ];
      "image/x-gray" = [ "org.gnome.eog.desktop" ];
      "image/x-icb" = [ "org.gnome.eog.desktop" ];
      "image/x-ico" = [ "org.gnome.eog.desktop" ];
      "image/x-png" = [ "org.gnome.eog.desktop" ];
      "image/x-portable-anymap" = [ "org.gnome.eog.desktop" ];
      "image/x-portable-bitmap" = [ "org.gnome.eog.desktop" ];
      "image/x-portable-graymap" = [ "org.gnome.eog.desktop" ];
      "image/x-portable-pixmap" = [ "org.gnome.eog.desktop" ];
      "image/x-xbitmap" = [ "org.gnome.eog.desktop" ];
      "image/x-xpixmap" = [ "org.gnome.eog.desktop" ];
      "image/x-pcx" = [ "org.gnome.eog.desktop" ];
      "image/svg+xml" = [ "org.gnome.eog.desktop" ];
      "image/svg+xml-compressed" = [ "org.gnome.eog.desktop" ];
      "image/vnd.wap.wbmp" = [ "org.gnome.eog.desktop" ];
      "image/x-icns" = [ "org.gnome.eog.desktop" ];
      # Video
      "video/3gp" = [ "org.gnome.Totem.desktop" "vlc.desktop" ];
      "video/3gpp" = [ "org.gnome.Totem.desktop" "vlc.desktop" ];
      "video/3gpp2" = [ "org.gnome.Totem.desktop" "vlc.desktop" ];
      "video/dv" = [ "org.gnome.Totem.desktop" "vlc.desktop" ];
      "video/divx" = [ "org.gnome.Totem.desktop" "vlc.desktop" ];
      "video/fli" = [ "org.gnome.Totem.desktop" "vlc.desktop" ];
      "video/flv" = [ "org.gnome.Totem.desktop" "vlc.desktop" ];
      "video/mp2t" = [ "org.gnome.Totem.desktop" "vlc.desktop" ];
      "video/mp4" = [ "org.gnome.Totem.desktop" "vlc.desktop" ];
      "video/mp4v-es" = [ "org.gnome.Totem.desktop" "vlc.desktop" ];
      "video/mpeg" = [ "org.gnome.Totem.desktop" "vlc.desktop" ];
      "video/mpeg-system" = [ "org.gnome.Totem.desktop" "vlc.desktop" ];
      "video/msvideo" = [ "org.gnome.Totem.desktop" "vlc.desktop" ];
      "video/ogg" = [ "org.gnome.Totem.desktop" "vlc.desktop" ];
      "video/quicktime" = [ "org.gnome.Totem.desktop" "vlc.desktop" ];
      "video/vnd.divx" = [ "org.gnome.Totem.desktop" "vlc.desktop" ];
      "video/vnd.mpegurl" = [ "org.gnome.Totem.desktop" "vlc.desktop" ];
      "video/vnd.rn-realvideo" = [ "org.gnome.Totem.desktop" "vlc.desktop" ];
      "video/webm" = [ "org.gnome.Totem.desktop" "vlc.desktop" ];
      "video/x-anim" = [ "org.gnome.Totem.desktop" "vlc.desktop" ];
      "video/x-avi" = [ "org.gnome.Totem.desktop" "vlc.desktop" ];
      "video/x-flc" = [ "org.gnome.Totem.desktop" "vlc.desktop" ];
      "video/x-fli" = [ "org.gnome.Totem.desktop" "vlc.desktop" ];
      "video/x-flv" = [ "org.gnome.Totem.desktop" "vlc.desktop" ];
      "video/x-m4v" = [ "org.gnome.Totem.desktop" "vlc.desktop" ];
      "video/x-matroska" = [ "org.gnome.Totem.desktop" "vlc.desktop" ];
      "video/x-mpeg" = [ "org.gnome.Totem.desktop" "vlc.desktop" ];
      "video/x-mpeg2" = [ "org.gnome.Totem.desktop" "vlc.desktop" ];
      "video/x-ms-asf" = [ "org.gnome.Totem.desktop" "vlc.desktop" ];
      "video/x-ms-asf-plugin" = [ "org.gnome.Totem.desktop" "vlc.desktop" ];
      "video/x-ms-asx" = [ "org.gnome.Totem.desktop" "vlc.desktop" ];
      "video/x-msvideo" = [ "org.gnome.Totem.desktop" "vlc.desktop" ];
      "video/x-ms-wm" = [ "org.gnome.Totem.desktop" "vlc.desktop" ];
      "video/x-ms-wmv" = [ "org.gnome.Totem.desktop" "vlc.desktop" ];
      "video/x-ms-wmx" = [ "org.gnome.Totem.desktop" "vlc.desktop" ];
      "video/x-ms-wvx" = [ "org.gnome.Totem.desktop" "vlc.desktop" ];
      "video/x-nsv" = [ "org.gnome.Totem.desktop" "vlc.desktop" ];
      "video/x-theora" = [ "org.gnome.Totem.desktop" "vlc.desktop" ];
      "video/x-theora+ogg" = [ "org.gnome.Totem.desktop" "vlc.desktop" ];
      # Documents
      "application/vnd.oasis.opendocument.text" = [ "writer.desktop" ];
      "application/vnd.openxmlformats-officedocument.wordprocessingml.document" = [ "writer.desktop" ];
      "application/pdf" = [ "org.gnome.Evince.desktop" ];
    };
  };
}
