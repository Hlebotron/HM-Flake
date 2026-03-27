{ self, inputs, lib, ... }:

{
  flake.modules.nixos.probook = { config, pkgs, ... }: {
    imports = [
      self.modules.nixos.networking
      # ./hardware-configuration.nix
      # ./my-dev-tools.nix
      # ./my-desktop-env.nix
      # ./etc.nix
    ];

    # Name your host machine
    networking.hostName = "probook";
    
    # Set your time zone.
    time.timeZone = "Europe/Budapest";

    # Enter keyboard layout
    services.xserver.layout = "us";
    # services.xserver.xkbVariant = "altgr-intl";

    # Define user accounts
    users.users.myuser = {
      extraGroups = [ "wheel" "networkmanager" ];
      isNormalUser = true;
    };
    
    # Install some packages
    environment.systemPackages = with pkgs; [
      ddate
      testdisk
    ]; 
    
    # Enable the OpenSSH daemon
    services.openssh.enable = true;
  };

  flake.modules.nixos.networking = { config, pkgs, ... }: {

  };
}
