	{ config, pkgs, nixvim, inputs, stylix, ... }:

let
	packages = with pkgs; [
		grim
		nyxt
		pavucontrol
		adwaita-icon-theme
		brightnessctl
		gimp
		gnome-characters
		hyprpaper
		mpc
		yt-dlp
		wlrctl
		zeal
		luakit
		home-manager
		wl-clipboard
		zoxide
		kitty
		alacritty		
		prismlauncher
		steam
		fastfetch
		#cargo
		#rustup
		#rustc
		#patchelf
		#waybar
		git
		qutebrowser
		nextcloud-client
		#xorg.xrandr
		fuzzel
		zip
		unzip
		eog
		#gcc
		#autoPatchelfHook	
		gnome-terminal
		postman
		#python3
		papers
		libreoffice
		xorg.libXtst
		#jre_minimal
		#jdk
		#blender
		waybar
		sops
	];
	packages-unstable = with pkgs.unstable; [

	];
	in {
	imports = [
		#./scripts.nix
		./modules/nixvim.nix
	];
	#stylix.autoEnable = true;
	programs = {
		emacs = {
			enable = true;
			extraPackages = epkgs: with epkgs; [
        magit
				nix-mode
				org-bullets
				evil
				multiple-cursors
				#nixos-options
				org
				key-chord
				tree-sitter
				rust-mode
				ivy
			];
			extraConfig = builtins.readFile ./dotfiles/emacs/init.el; # ''
			# 	;; (unless (file-exists-p "~/.emacs")
 			# 	;;   (create-empty-file "~/.emacs"))
      #   ;;(add-to-list 'default-frame-alist
			# 	;;    '(font . "dejavu sans mono-15"))
      #   ;; (set-frame-font "-ukwn-iosevka-regular-normal-expanded-*-13-*-*-*-d-0-iso10646-11")
      #   (set-face-attribute 'default nil :family "iosevka")
      #   (menu-bar-mode 0)
      #   (tool-bar-mode 0)
      #   (scroll-bar-mode 0)
      #   (ido-mode 1)
      #   (ivy-mode 1)
      #   (setq display-line-numbers 'relative)
      #   (setq inhibit-startup-message 1)
      #   (require 'nix-mode)
      #   ;; (require 'org-mode)
	
      #   (global-set-key (kbd "c-s-c c-s-c") 'mc/edit-lines)
      #   (global-set-key (kbd "c->") 'mc/mark-next-like-this)
      #   (global-set-key (kbd "c-<") 'mc/mark-previous-like-this)
      #   (global-set-key (kbd "c-c c-<") 'mc/mark-all-like-this)
      #   (require 'multiple-cursors)
      #   ;; (evil-mode 1)
      #   (defun org-setup () "configure org mode"
      #          (setq org-hide-emphasis-markers t)
      #          (setq org-ellipsis " ⏷")
      #          (setq visual-line-mode 1)
      #          (setq auto-fill-mode 1)
      #          (font-lock-mode 1)				
			# 	       (multiple-cursors-mode 1)
      #          (org-bullets-mode 1)
      #          (prettify-symbols-mode 1)
      #          (font-lock-add-keywords 'org-mode
			# 				 		'(("^ *\\([-]\\) "
			# 						(0 (prog1 () (compose-region (match-beginning 1) (match-end 1) "•"))))))
			# 						(custom-theme-set-faces
			# 							'user
			# 	        		'(variable-pitch ((t (:family "etbembo" :height 180 :weight thin))))
			# 	        		'(fixed-pitch ((t ( :family "fira code retina" :height 160)))))
			# 	       	        (dolist (face '(
			# 		      					(org-level-1 . 1.2)
			# 		      					(org-level-2 . 1.1)
			# 		      					(org-level-3 . 1.05)
			# 		      					(org-level-4 . 1.0)
			# 		      					(org-level-5 . 0.95)
			# 		      					(org-level-6 . 0.9)
			# 		      					(org-level-7 . 0.85)
			# 		      					(org-level-8 . 0.8)))
			# 									(set-face-attribute (car face) nil :family "iawriter sans duospace" :weight 'bold :height (cdr face)))
			# 									(set-face-attribute 'org-block nil :foreground nil :height 1.0 :inherit 'fixed-pitch)
			# 									(set-face-attribute 'org-code nil :inherit '(shadow fixed-pitch))
			# 									;; (set-face-attribute 'org-indent nil :inherit '(org-hide fixed-pitch))
			# 									(set-face-attribute 'org-verbatim nil :inherit '(shadow fixed-pitch))
			# 									(set-face-attribute 'org-special-keyword nil :inherit '(font-lock-comment-face fixed-pitch))
			# 									(set-face-attribute 'org-meta-line nil :inherit '(font-lock-comment-face fixed-pitch))
			# 									(set-face-attribute 'org-checkbox nil :height 1.0 :inherit 'fixed-pitch)
			# 									(put 'downcase-region 'disabled nil)
			# 									(add-hook 'org-mode-hook (lambda ()
			# 										  "beautify org checkbox symbol"
			# 											  (setq prettify-symbols-alist
			# 												  	(prettify-utils-generate
			# 																("[ ]" "☐")
			# 																("[x]" "☑")
			# 																("[-]" "❍")))
			# 																(prettify-symbols-mode)))

               
      #   )
			# 	(require 'key-chord)
			# 	(add-hook 'org-mode-hook 'org-setup)
			# 	(key-chord-define-global "fg" "c-s")
			# 	;; (use-package 'org-bullets
			# 	;;   :config
			# 	;;   (add-hook 'org-mode-hook (lambda () (org-bullets-mode 1))))
								
			# '';
		};
		bash = {
			enable = true;
			shellAliases = {
				nconf = "nvim /etc/nixos/hosts/$HOSTNAME/configuration.nix";
				rl = "source ~/.bashrc";
				pkgs = "man configuration.nix";
				hlconf = "nvim ~/.config/hypr/hyprland.conf";
				server = "ssh sasha@192.168.1.169";
				addtimepc = "ssh 192.168.1.103 \"~/addtime.sh $1\"";
				addtimedell = "ssh 192.168.1.182 \"~/addtime.sh $1\"";
				flake = "nvim /etc/nixos/flake.nix";
				n = "nvim";
				nrs = "nh os switch /etc/nixos";
				hms = "nh home switch /home/sasha/.config/home-manager";
				home = "nvim ~/.config/home-manager/users/$USER/home.nix";
				nixos = "cd /etc/nixos";
				c = "z";
				dev = "nix develop";
				timeleftpc = "ssh 192.168.1.103 \"echo $(($(cat /opt/limit/ticksLeft) * $(cat /opt/limit/tickLengthSecs) / 60))\"";
				timeleftdell = "ssh 192.168.1.182 \"echo $(($(cat /opt/limit/ticksLeft) * $(cat /opt/limit/tickLengthSecs) / 60))\"";
				nixvim = "nvim ~/.config/home-manager/users/$USER/modules/nixvim.nix";
			};
			initExtra = "fastfetch";
			#shellInit = "fastfetch";
			#interactiveShellInit = "fastfetch";
		};
		nh.enable = true;
		git = {
			enable = true;
			userEmail = "stabasov@gmail.com"; 
			userName = "Hlebotron";
		};
		nixvim.enable = true;
		zoxide.enable = true;
	};
	services = {
	    mpd = {
		enable = true;
		musicDirectory = "/home/sasha/Music";
		extraConfig = ''
			audio_output {
				type "pipewire"
				name "Wire of Pipe"
			}
			auto_update "yes"
		'';
		network.listenAddress = "any";
   	    };
	    emacs.enable = true;
	};
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
		username = "sasha";
		homeDirectory = "/home/sasha";


		# Home Manager is pretty good at managing dotfiles. The primary way to manage
		# plain files is through 'home.file'.
		file = {
      # ".config/init.el".source = ./dotfiles/emacs/init.el;
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
		sessionVariables = {
			EDITOR = "nvim";
			MPD_HOST = "/run/user/1000/mpd/socket";
		};
		stateVersion = "24.05";  
	};
}
