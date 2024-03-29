{ inputs, nixpkgs, nixpkgs-unstable, home-manager, ... }:
let
	mobilehead = {};
	zerodev = {};
	vm = {
		userName = "zero";
		hostName = "vm";
	};
in
{
  "mobilehead" = nixpkgs.lib.nixosSystem {
    system = "x86_64-linux";
    specialArgs = {
      systemVars = {
        userName = "zettlrobert";
        hostName = "mobilehead";
      };
    };
    modules = [
      ./mobilehead/configuration.nix
      ../shared/packages.nix
      home-manager.nixosModules.home-manager {
        home-manager.useGlobalPkgs = true;
        home-manager.useUserPackages = true;
        home-manager.users.zettlrobert = import ./mobilehead/home.nix;
      }
    ];
  };

  "zerodev" = nixpkgs.lib.nixosSystem {
    system = "x86_64-linux";
    specialArgs = {
      systemVars = {
        userName = "zettlrobert";
        hostName = "zerodev";
      };
    };
    modules = [
      ./zerodev
      home-manager.nixosModules.home-manager {
        home-manager.useGlobalPkgs = true;
        home-manager.useUserPackages = true;
        home-manager.users.zettlrobert = import ./zerodev/home.nix;
      }
    ];
  };

  "vm" = nixpkgs.lib.nixosSystem {
    system = "x86_64-linux";
    specialArgs = {
      systemVars = {
        userName = "zero";
        hostName = "nixos-vm";
      };
    };
    modules = [
      ./vm
      home-manager.nixosModules.home-manager {
        home-manager.useGlobalPkgs = true;
        home-manager.useUserPackages = true;
        home-manager.users.zero = import ./vm/home.nix;
      }
    ];
  };
}
