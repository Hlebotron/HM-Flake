{
  description = "Home Manager configuration of sasha";

  inputs = {
    # Specify the source of Home Manager and Nixpkgs.
    nixpkgs.url = "github:nixos/nixpkgs/nixos-25.05";
    home-manager = {
      url = "github:nix-community/home-manager/release-25.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixvim = {
      url = "github:nix-community/nixvim/nixos-25.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    stylix.url = "github:danth/stylix/release-25.05";
  };

  outputs = { nixpkgs, home-manager, nixvim, stylix, ... }@inputs:
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs {
        inherit system;
        config = {
          allowUnfree = true;
        };
      };
    in {
      homeConfigurations = {
        sasha = home-manager.lib.homeManagerConfiguration {
          inherit pkgs;
          extraSpecialArgs = { inherit inputs; };

          # Specify your home configuration modules here, for example,
          # the path to your home.nix.
          modules = [ 
            ./users/sasha/home.nix 
            nixvim.homeManagerModules.nixvim
            stylix.homeModules.stylix
          ];

          # Optionally use extraSpecialArgs
          # to pass through arguments to home.nix
        };
        maxim = home-manager.lib.homeManagerConfiguration {
          inherit pkgs;
          extraSpecialArgs = { inherit inputs; };

          # Specify your home configuration modules here, for example,
          # the path to your home.nix.
          modules = [ 
            ./users/maxim/home.nix 
            #nixvim.homeManagerModules.nixvim
            stylix.homeModules.stylix
          ];

          # Optionally use extraSpecialArgs
          # to pass through arguments to home.nix
        };
      };
    };
}
