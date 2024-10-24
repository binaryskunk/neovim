{
  description = "BinarySkunk's personal nixvim config";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixvim.url = "github:nix-community/nixvim";
    rust-overlay.url = "github:oxalica/rust-overlay";
  };

  outputs = { nixpkgs, nixvim, rust-overlay, ... }:
  let
    systems = [ "x86_64-linux" "aarch64-linux" ];

    forEachSystem = f: with nixpkgs.lib; foldAttrs mergeAttrs {}
      (lists.forEach systems
        (system: mapAttrs
	  (name: value: { ${system} = value; }) (f system)));

  in forEachSystem
    (system:
    let
      overlays = [ (import rust-overlay) ];

      pkgs = import nixpkgs {
        inherit system overlays;
      };

      nixvimLib = nixvim.lib.${system};
      nixvim' = nixvim.legacyPackages.${system};

      nixvimModule = {
        inherit pkgs;
	module = import ./config;
      };

      nvim = nixvim'.makeNixvimWithModule nixvimModule;

    in rec {
      checks.default = nixvimLib.check.mkTestDerivationFromNixvimModule nixvimModule;

      packages.default = nvim;
    });
}
