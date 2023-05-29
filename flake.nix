{
  description = "My configuration";
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-23.05";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager/release-23.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # Nix-LD, Run unpatched dynamic binaries on NixOS.
    nix-ld = {
      url = "github:Mic92/nix-ld";
      inputs = {
        nixpkgs.follows = "nixpkgs";
      };
    };
    nix-alien = {
      url = "github:thiagokokada/nix-alien";
      inputs = {
        nixpkgs.follows = "nixpkgs";
      };
    };
  };
  outputs = { self, nixpkgs, home-manager, ... }@inputs:
    let
      inherit (self) outputs;
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
    in
    {
      nixosConfigurations = {
        main = nixpkgs.lib.nixosSystem {
          specialArgs = { inherit inputs outputs; };
          modules = [ ./nixos/main/configuration.nix ];
        };
        office = nixpkgs.lib.nixosSystem {
          specialArgs = { inherit inputs outputs; };
          modules = [ ./nixos/office/configuration.nix ];
        };
      };

      homeConfigurations = {
        main = home-manager.lib.homeManagerConfiguration {
          inherit pkgs;
          extraSpecialArgs = { inherit inputs outputs; };
          modules = [ ./home-manager/main/home.nix ];
        };
        office = home-manager.lib.homeManagerConfiguration {
          inherit pkgs;
          extraSpecialArgs = { inherit inputs outputs; };
          modules = [ ./home-manager/office/home.nix ];
        };
      };
    };
}
