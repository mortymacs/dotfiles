{
  description = "My configuration";
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-22.11";
    home-manager = {
      url = "github:nix-community/home-manager/release-22.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    lsp-lens-nvim = {
      url = "github:VidocqH/lsp-lens.nvim";
      flake = false;
    };

  };
  outputs = { self, nixpkgs, home-manager, ... }:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
      vimNixPackages = pkgs: inputs: {
        lsp-lens-nvim = pkgs.vimUtils.buildVimPluginFrom2Nix {
          name = "lsp-lens-nvim";
          src = inputs.lsp-lens-nvim;
        };
      };
    in
    {
      overlay = _final: prev: {
        vimPlugins = prev.vimPlugins // (vimNixPackages prev.pkgs);
      };

      nixosConfigurations = {
        main = nixpkgs.lib.nixosSystem {
          modules = [ ./nixos/main/configuration.nix ];
        };
      };

      homeConfigurations = {
        main = home-manager.lib.homeManagerConfiguration {
          inherit pkgs;
          modules = [ ./home-manager/main/home.nix ];
        };
      };
    };
}
