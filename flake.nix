{
  description = "Nix OS System Configurations";

  inputs = {
    nixpkgs = {
      url = "github:nixos/nixpkgs/nixos-23.05";
    };
    nixpkgs-unstable = {
       url = "github:nixos/nixpkgs/nixos-unstable";
    };
    home-manager = {
      url = "github:nix-community/home-manager/release-23.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  # The `@` syntax here is used to alias the attribute set of the
  # inputs's parameter, making it convenient to use inside the function.
  outputs = { self, nixpkgs, nixpkgs-unstable, home-manager, ... }@inputs: 
    {
        nixosConfigurations = (                                               # NixOS Configurations
          import ./hosts {
            inherit (nixpkgs) lib;
            inherit inputs nixpkgs nixpkgs-unstable home-manager;
          }
        );

      # nixosConfigurations = {
      #   "zettlrobert" = nixpkgs.lib.nixosSystem {
      #     system = "x86_64-linux";
      #     modules = [
      #       ./hosts/zerodev/configuration.nix
      #       ./shared/packages.nix
      #       home-manager.nixosModules.home-manager
      #       {
      #         home-manager.useGlobalPkgs = true;
      #         home-manager.useUserPackages = true;

      #         home-manager.users.zettlrobert = import ./hosts/zerodev/zerodev-home-manager.nix;
      #       }
      #     ];
      #   };
      # };
    };
}
