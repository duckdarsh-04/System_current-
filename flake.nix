{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-25.11";
    nvf.url = "github:notashelf/nvf";
    stylix.url = "github:danth/stylix/release-25.11";
    yt-x.url = "github:Benexl/yt-x";
    home-manager.url = "github:nix-community/home-manager/release-25.11";
    dark-send.url = "path:/home/duckdarsh/dark-send-pr";
    zen-browser.url = "github:0xc000022070/zen-browser-flake";
    winapps.url = "github:winapps-org/winapps";
  };

  outputs = inputs @ {
    self,
    nixpkgs,
    nvf,
    ...
  }: let
    system = "x86_64-linux";
    pkgs = import nixpkgs {
      inherit system;
      config.allowUnfree = true;
    };
    neovimConfiguration = nvf.lib.neovimConfiguration {
      inherit pkgs;
      modules = [./nvf.nix];
    };
    neovimPkg = neovimConfiguration.neovim;
  in {
    formatter.${system} = pkgs.alejandra;
    packages.${system}.default = neovimPkg;

    nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
      inherit system;
      modules = [
        ./configuration.nix
        inputs.stylix.nixosModules.stylix
        inputs.nvf.nixosModules.default
        inputs.home-manager.nixosModules.default

        {
          config.environment.systemPackages = [
            neovimPkg
            inputs.yt-x.packages.${system}.default
            inputs.dark-send.packages.${system}.dark-send
            inputs.zen-browser.packages.${system}.default
            inputs.winapps.packages.${system}.winapps
          ];
        }
      ];
    };
  };
}
