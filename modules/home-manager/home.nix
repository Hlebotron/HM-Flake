{ self, inputs, ... }:

{
  flake.homeConfigurations.sasha = inputs.home-manager.lib.homeManagerConfiguration {
    pkgs = import inputs.nixpkgs {
      system = "x86_64-linux";
      overlays = [ inputs.nixgl.overlay ];
    };
    modules =
      (with inputs; [
        stylix.homeModules.stylix
      ]) ++
      (with self.homeModules; [
        sasha
        packages
      ]);
  };
}
