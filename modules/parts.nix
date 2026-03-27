{ inputs, ... }:

{
  config = {
    systems = [
      "x86_64-linux"
      "x86_64-darwin"
      "aarch64-linux"
      "aarch64-darwin"
    ];
  };
  imports = with inputs; [
    flake-parts.flakeModules.modules
    home-manager.flakeModules.home-manager
  ];
}
