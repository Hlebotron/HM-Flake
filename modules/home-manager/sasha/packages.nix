{ self, inputs, ...}:

{
  flake.homeModules.packages = { pkgs, ... }: {
    home.packages = with pkgs; ([
      # # Adds the 'hello' command to your environment. It prints a friendly
      # # "Hello, world!" when run.
      # pkgs.hello

      # # It is sometimes useful to fine-tune packages, for example, by applying
      # # overrides. You can do that directly here, just don't forget the
      # # parentheses. Maybe you want to install Nerd Fonts with a limited number of
      # # fonts?
      # (pkgs.nerdfonts.override { fonts = [ "FantasqueSansMono" ]; })

      # # You can also create simple shell scripts directly inside your
      # # configuration. For example, this adds a command 'my-hello' to your
      # # environment:
      # (pkgs.writeShellScriptBin "my-hello" ''
      #   echo "Hello, ${config.home.username}!"
      # '')
      zeal
      nixgl.nixGLIntel
      yt-dlp
      orca-slicer
      mpv
      steam
      # wine64
      wine64Packages.fonts
      protontricks
      # protonup-rs
      # gamescope
      nyxt
      # iosevka
      winetricks
      mpc
      screen
      platformio
      wineWow64Packages.waylandFull
      clisp
      emacs-gtk
      evince
      fastfetch
      libreoffice
      # iosevka
      drawio
      blender
      eog
      kdePackages.kdenlive
      audacity
      libheif
      kicad
      picocom
      claude-code
      openscad
      gdb
      htmldoc
      pandoc
      texliveSmall
      geogebra
      nix-index
      gtypist
      itd
      watchmate
      gst_all_1.gstreamer
      # wine
    ]) ++ (with pkgs-unstable; [

    ]);
  };
}
