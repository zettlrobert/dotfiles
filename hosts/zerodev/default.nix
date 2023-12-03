{ inputs, nixpkgs, nixpkgs-unstable, home-manager, ...}:

{
  imports = [
    ./configuration.nix
    ../../shared/packages.nix
  ];
}
