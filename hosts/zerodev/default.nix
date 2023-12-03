{ inputs, nixpkgs, nixpkgs-unstable, home-manager, ... }:
{
  "zerodev" = nixpkgs.lib.nixosSystem {
    system = "x86_64-linux";
    specialArgs = {
      systemVars = {
        userName = "zettlrobert";
        hostName = "zerodev";
      };
    };
    modules = [
      ./configuration.nix
      ../../shared/packages.nix
      home-manager.nixosModules.home-manager {
        home-manager.useGlobalPkgs = true;
        home-manager.useUserPackages = true;
        home-manager.users.zettlrobert = import ./home.nix;
      }
    ];
  };
}
