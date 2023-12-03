{ inputs, nixpkgs, nixpkgs-unstable, home-manager, vars ... }:

{
  zerodev = (
   import ./zerodev (
    inherit (nixpkgs) lib;
    inherit inputs nixpkgs nixpkgs-unstable home-manager vars;
   )
  );

  mobilehead = (
   import ./mobilehead (
    inherit (nixpkgs) lib;
    inherit inputs nixpkgs nixpkgs-unstable home-manager vars;
   )
  );
}
