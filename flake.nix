{
  description = "My configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-25.11";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";
    nixos-hardware.url = "github:NixOS/nixos-hardware/master";
    home-manager = {
      url = "github:nix-community/home-manager/release-25.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    zed-editor.url = "github:zed-industries/zed";
    llama-cpp = {
      url = "github:ggml-org/llama.cpp";
      inputs.nixpkgs.follows = "nixpkgs-unstable";
    };
    disko = {
      url = "github:nix-community/disko/latest";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    {
      self,
      nixpkgs,
      home-manager,
      ...
    }@inputs:
    let
      inherit (self) outputs;
      pkgs = import nixpkgs {
        localSystem = "x86_64-linux";
        config.allowUnfree = true;
        overlays = import ./overlays inputs;
      };

      mkNixos =
        modules:
        nixpkgs.lib.nixosSystem {
          specialArgs = { inherit inputs outputs; };
          inherit modules;
        };

      mkHome =
        modules:
        home-manager.lib.homeManagerConfiguration {
          inherit pkgs;
          extraSpecialArgs = { inherit inputs outputs; };
          inherit modules;
        };
    in
    {
      nixosConfigurations = {
        dell = mkNixos [
          ./nixos/dell/configuration.nix
          ./nixos/dell/disk-configuration.nix
          inputs.disko.nixosModules.disko
          inputs.nixos-hardware.nixosModules.dell-xps-13-9370
        ];
        lenovo = mkNixos [
          ./nixos/lenovo/configuration.nix
          ./nixos/lenovo/disk-configuration.nix
          inputs.disko.nixosModules.disko
        ];
        work = mkNixos [
          ./nixos/work/configuration.nix
          ./nixos/work/disk-configuration.nix
          inputs.disko.nixosModules.disko
          inputs.nixos-hardware.nixosModules.lenovo-thinkpad-t14
        ];
      };

      homeConfigurations = {
        dell = mkHome [ ./home-manager/dell/home.nix ];
        lenovo = mkHome [ ./home-manager/lenovo/home.nix ];
        work = mkHome [ ./home-manager/work/home.nix ];
      };
    };
}
