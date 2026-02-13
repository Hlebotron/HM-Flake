{ config, pkgs, pkgs-unstable, lib, stylix, ... }:

{


  # The home.packages option allows you to install Nix packages into your
  # environment.
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
    gamescope
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
    # wine
  ]) ++ (with pkgs-unstable; [
    openscad   
  ]);
  #++ map (pkg: nixGLWrap pkg) with pkgs; [
  #  orca-slicer
  #  mpv
  #  # 
  #];
  

  programs = {
    # Let Home Manager install and manage itself.
    home-manager.enable = true;
    git = {
      enable = true;
      settings = {
        user = {
          email = "stabasov@gmail.com";
          name = "Hlebotron";
        };
      };
    };
    # steam.enable = true;
    man = {
      enable = true;
      generateCaches = true;
    };
  };

  services = {
    mpd = {
      enable = true;
      dataDir = /home/sasha/.mpd;
      musicDirectory = /home/sasha/Music;
      network.listenAddress = "/home/sasha/.mpd/socket";
    };
  };
  
  stylix = {
    enable = true;
    autoEnable = true;
    base16Scheme = "${pkgs.base16-schemes}/share/themes/tokyo-city-dark.yaml";
  };

  targets.genericLinux = {
    gpu.enable = true;
    nixGL = {
      installScripts = [ "mesa" "mesaPrime" ];
      vulkan.enable = true;
    };
  };

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
    # # Building this configuration will create a copy of 'dotfiles/screenrc' in
    # # the Nix store. Activating the configuration will then make '~/.screenrc' a
    # # symlink to the Nix store copy.
    # ".screenrc".source = dotfiles/screenrc;

    # # You can also set the file content immediately.
    # ".gradle/gradle.properties".text = ''
    #   org.gradle.console=verbose
    #   org.gradle.daemon.idletimeout=3600000
    # '';
  };

  # Home Manager can also manage your environment variables through
  # 'home.sessionVariables'. These will be explicitly sourced when using a
  # shell provided by Home Manager. If you don't want to manage your shell
  # through Home Manager then you have to manually source 'hm-session-vars.sh'
  # located at either
  #
  #  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  ~/.local/state/nix/profiles/profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  /etc/profiles/per-user/sasha/etc/profile.d/hm-session-vars.sh
  #
  home.sessionVariables = {
    EDITOR = "emacs";
  };
  nixpkgs.config.allowUnfree = true;

  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "sasha";
  home.homeDirectory = "/var/home/sasha";

  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "25.11"; # Please read the comment before changing.

}
