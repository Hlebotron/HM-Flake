{ config, pkgs, inputs, stylix, ... }:

let
    packages = with pkgs; [
      gnomeExtensions.airpod-battery-monitor 
      xfce.mousepad
      adwaita-icon-theme
      gimp
      #gnome-characters
      home-manager
      prismlauncher
      steam
      fastfetch
      eog
      gnome-terminal
      papers
      libreoffice
    ];
    packages-unstable = with pkgs.unstable; [
        
    ];
in {
  imports = [
    #./scripts.nix
  ];
  #stylix.autoEnable = true;
  programs = {
    bash = {
      enable = true;
      shellAliases = {
        #nconf = "mousepad /etc/nixos/configuration.nix";
        rl = "source ~/.bashrc";
        #pkgs = "man configuration.nix";
        #hlconf = "mousepad ~/.config/hypr/hyprland.conf";
        #server = "ssh sasha@192.168.1.169";
        #addtime = "ssh sasha@192.168.1.103 \"~/addtime.sh $1\"";
        #flake = "mousepad /etc/nixos/flake.nix";
        #n = "mousepad";
        #nrs = "nh os switch /etc/nixos";
        hms = "nh home switch ~/.config/home-manager/";
        home = "mousepad ~/.config/home-manager/$USER/home.nix";
        #nixos = "cd /etc/nixos";
        c = "z";
      };
      initExtra = "fastfetch";
      #shellInit = "fastfetch";
      #interactiveShellInit = "fastfetch";
    };
    nh.enable = true;
  };
  nixpkgs.config.allowUnfree = true;
  stylix = {
    enable = true;
    base16Scheme = "${pkgs.base16-schemes}/share/themes/tokyo-city-dark.yaml";
    image = ./wallpaper.png;
    cursor = {
        name = "Bibata-Modern-Classic";
        package = pkgs.bibata-cursors;
        size = 20;
    };
  };
  home = {
    packages = packages ++ packages-unstable;
    username = "maxim";
    homeDirectory = "/home/maxim";


    # Home Manager is pretty good at managing dotfiles. The primary way to manage
    # plain files is through 'home.file'.
    file = {
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
    #  /etc/profiles/per-user/maxim/etc/profile.d/hm-session-vars.sh
    #
    sessionVariables = {
      EDITOR = "mousepad";
    };
    stateVersion = "24.05";  
  };
}
