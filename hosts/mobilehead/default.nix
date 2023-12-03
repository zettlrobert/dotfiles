{ inputs, nixpkgs, nixpkgs-unstable, home-manager, vars, ... }:

{
  nixpkgs.lib.nixosSystem {
    system = "x86_64-linux";
    username = "zettlrobert";
    hostname = "zerodev";
    modules = [
      ./configuration.nix
      ../../shared/packages.nix
      home-manager.nixosModules.home-manager {
        home-manager.useGlobalPkgs = true;
        home-manager.useUserPackages = true;
        home-manager.users.zettlrobert = import ./zerodev-home-manager.nix;
      }
    ];
  };
}
