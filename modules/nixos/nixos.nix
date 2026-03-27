{ inputs, lib, ... }:

{
  flake.nixosConfigurations = {
    
    probook = inputs.nixpkgs.lib.nixosSystem {
      modules = [
        inputs.self.modules.nixos.probook
        { nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux"; }
      ];
    };
    
  };
}
