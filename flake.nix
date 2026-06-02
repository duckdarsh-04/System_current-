{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-25.11";
    nixpkgs-unstable.url = "nixpkgs/nixos-unstable";
    nvf.url = "github:notashelf/nvf";
    stylix.url = "github:danth/stylix/release-25.11";
    yt-x.url = "github:Benexl/yt-x";
    home-manager.url = "github:nix-community/home-manager/release-25.11";
    zen-browser.url = "github:0xc000022070/zen-browser-flake";
    dark-send.url = "github:duckdarsh-04/dark-send";
    sops-nix.url = "github:Mic92/sops-nix";
    colmena.url = "github:zhaofengli/colmena";
  };

  outputs =
    inputs@{
      self,
      nixpkgs,
      nixpkgs-unstable,
      nvf,
      home-manager,
      colmena,
      ...
    }:
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs {
        inherit system;
        config.allowUnfree = true;
      };

      pkgs-unstable = import nixpkgs-unstable {
        inherit system;
        config.allowUnfree = true;
      };

      neovimConfiguration = nvf.lib.neovimConfiguration {
        inherit pkgs;
        modules = [ ./nvf.nix ];
      };
      neovimPkg = neovimConfiguration.neovim;
      serverModules = [
        ./hosts/nixos-server/configuration.nix
        inputs.nvf.nixosModules.default
        inputs.home-manager.nixosModules.default
        inputs.sops-nix.nixosModules.sops
        { environment.systemPackages = [ neovimPkg ]; }
      ];
    in
    {
      formatter.${system} = pkgs.alejandra;
      packages.${system}.default = neovimPkg;

      nixosConfigurations = {
        nixos = nixpkgs.lib.nixosSystem {
          inherit system;
          specialArgs = {
            inherit inputs;
            inherit pkgs-unstable;
          };
          modules = [
            ./hosts/nixos-desktop/configuration.nix
            inputs.stylix.nixosModules.stylix
            inputs.nvf.nixosModules.default
            inputs.home-manager.nixosModules.default
            inputs.sops-nix.nixosModules.sops
            {
              config.environment.systemPackages = [
                neovimPkg
                inputs.yt-x.packages.${system}.default
                inputs.zen-browser.packages.${system}.default
                inputs.colmena.packages.${system}.colmena
              ];
            }
          ];
        };
        # Server
        nixos-server = nixpkgs.lib.nixosSystem {
          inherit system;
          modules = serverModules;
        };
      };
      colmenaHive = colmena.lib.makeHive {
        meta = {
          nixpkgs = pkgs;
        };
        nixos-server = {
          deployment = {
            targetHost = "100.104.174.121";
            targetUser = "duckdarsh";
          };
          imports = serverModules;
        };
      };
    };
}
