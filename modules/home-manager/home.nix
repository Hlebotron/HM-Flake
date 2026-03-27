{ self, inputs, ... }:

{
  flake.homeConfigurations = {
    sasha = inputs.home-manager.lib.homeManagerConfiguration {
      pkgs = import inputs.nixpkgs {
        system = "x86_64-linux";
        overlays = with inputs; [
          nixgl.overlay
          niri.overlays.niri
        ];
      };
      modules = [
        inputs.stylix.homeModules.stylix
        self.modules.homeManager.sasha
      ];
    };
  };
}
