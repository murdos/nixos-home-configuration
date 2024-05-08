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
    pdftk # for manipulating pdfs
    xournalpp # for annotating pdfs
    handbrake # for converting videos
    inkscape
    tilix # for a better terminal
    obsidian
    bitwarden
    pinta # for quick image editing
    vlc
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
      "image/gif" = [ "org.gnome.Loupe.desktop" ];
      "image/webp" = [ "org.gnome.Loupe.desktop" ];
      "image/bmp" = [ "org.gnome.Loupe.desktop" ];
      "image/jpg" = [ "org.gnome.Loupe.desktop" ];
      "image/jxl" = [ "org.gnome.Loupe.desktop" ];
      "image/jpeg" = [ "org.gnome.Loupe.desktop" ];
      "image/pjpeg" = [ "org.gnome.Loupe.desktop" ];
      "image/png" = [ "org.gnome.Loupe.desktop" ];
      "image/tiff" = [ "org.gnome.Loupe.desktop" ];
      "image/x-bmp" = [ "org.gnome.Loupe.desktop" ];
      "image/x-gray" = [ "org.gnome.Loupe.desktop" ];
      "image/x-icb" = [ "org.gnome.Loupe.desktop" ];
      "image/x-ico" = [ "org.gnome.Loupe.desktop" ];
      "image/x-png" = [ "org.gnome.Loupe.desktop" ];
      "image/x-portable-anymap" = [ "org.gnome.Loupe.desktop" ];
      "image/x-portable-bitmap" = [ "org.gnome.Loupe.desktop" ];
      "image/x-portable-graymap" = [ "org.gnome.Loupe.desktop" ];
      "image/x-portable-pixmap" = [ "org.gnome.Loupe.desktop" ];
      "image/x-xbitmap" = [ "org.gnome.Loupe.desktop" ];
      "image/x-xpixmap" = [ "org.gnome.Loupe.desktop" ];
      "image/x-pcx" = [ "org.gnome.Loupe.desktop" ];
      "image/svg+xml" = [ "org.gnome.Loupe.desktop" ];
      "image/svg+xml-compressed" = [ "org.gnome.Loupe.desktop" ];
      "image/vnd.wap.wbmp" = [ "org.gnome.Loupe.desktop" ];
      "image/x-icns" = [ "org.gnome.Loupe.desktop" ];
      "image/x-tga" = [ "org.gnome.Loupe.desktop" ];
      "image/vnd-ms.dds" = [ "org.gnome.Loupe.desktop" ];
      "image/x-dds" = [ "org.gnome.Loupe.desktop" ];
      "image/vnd.microsoft.icon" = [ "org.gnome.Loupe.desktop" ];
      "image/vnd.radiance=" = [ "org.gnome.Loupe.desktop" ];
      "image/x-exr" = [ "org.gnome.Loupe.desktop" ];
      "image/x-qoi" = [ "org.gnome.Loupe.desktop" ];
      "image/avif" = [ "org.gnome.Loupe.desktop" ];
      "image/heic" = [ "org.gnome.Loupe.desktop" ];
      # Video
      "video/3gp" = [ "vlc.desktop" ];
      "video/3gpp" = [ "vlc.desktop" ];
      "video/3gpp2" = [ "vlc.desktop" ];
      "video/dv" = [ "vlc.desktop" ];
      "video/divx" = [ "vlc.desktop" ];
      "video/fli" = [ "vlc.desktop" ];
      "video/flv" = [ "vlc.desktop" ];
      "video/mp2t" = [ "vlc.desktop" ];
      "video/mp4" = [ "vlc.desktop" ];
      "video/mp4v-es" = [ "vlc.desktop" ];
      "video/mpeg" = [ "vlc.desktop" ];
      "video/mpeg-system" = [ "vlc.desktop" ];
      "video/msvideo" = [ "vlc.desktop" ];
      "video/ogg" = [ "vlc.desktop" ];
      "video/quicktime" = [ "vlc.desktop" ];
      "video/vnd.divx" = [ "vlc.desktop" ];
      "video/vnd.mpegurl" = [ "vlc.desktop" ];
      "video/vnd.rn-realvideo" = [ "vlc.desktop" ];
      "video/webm" = [ "vlc.desktop" ];
      "video/x-anim" = [ "vlc.desktop" ];
      "video/x-avi" = [ "vlc.desktop" ];
      "video/x-flc" = [ "vlc.desktop" ];
      "video/x-fli" = [ "vlc.desktop" ];
      "video/x-flv" = [ "vlc.desktop" ];
      "video/x-m4v" = [ "vlc.desktop" ];
      "video/x-matroska" = [ "vlc.desktop" ];
      "video/x-mpeg" = [ "vlc.desktop" ];
      "video/x-mpeg2" = [ "vlc.desktop" ];
      "video/x-ms-asf" = [ "vlc.desktop" ];
      "video/x-ms-asf-plugin" = [ "vlc.desktop" ];
      "video/x-ms-asx" = [ "vlc.desktop" ];
      "video/x-msvideo" = [ "vlc.desktop" ];
      "video/x-ms-wm" = [ "vlc.desktop" ];
      "video/x-ms-wmv" = [ "vlc.desktop" ];
      "video/x-ms-wmx" = [ "vlc.desktop" ];
      "video/x-ms-wvx" = [ "vlc.desktop" ];
      "video/x-nsv" = [ "vlc.desktop" ];
      "video/x-theora" = [ "vlc.desktop" ];
      "video/x-theora+ogg" = [ "vlc.desktop" ];
      # Documents
      "application/vnd.oasis.opendocument.text" = [ "writer.desktop" ];
      "application/vnd.openxmlformats-officedocument.wordprocessingml.document" = [ "writer.desktop" ];
      "application/pdf" = [ "org.gnome.Evince.desktop" ];
    };
  };
}
