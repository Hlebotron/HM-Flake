{
  description = "Home Manager configuration of sasha";

  inputs = {
    # Specify the source of Home Manager and Nixpkgs.
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    determinate.url = "https://flakehub.com/f/DeterminateSystems/nixpkgs-weekly/0.1.930106";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "determinate";
    };
    nixgl.url = "github:nix-community/nixgl";
    stylix = {
      url = "github:nix-community/stylix";
      inputs.nixpkgs.follows = "determinate";
    };
  };

  outputs =
    { home-manager, determinate, nixgl, stylix, ... }:
    let
      system = "x86_64-linux";
      pkgs = import determinate {
        inherit system;
	overlays = [ nixgl.overlay ];
      };
    in
    {
      homeConfigurations."sasha" = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;

        # Specify your home configuration modules here, for example,
        # the path to your home.nix.
        modules = [
	  ./home.nix
	  stylix.homeModules.stylix
	];

        # Optionally use extraSpecialArgs
        # to pass through arguments to home.nix
      };
    };
}
