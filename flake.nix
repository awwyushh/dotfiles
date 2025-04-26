{
  description = "Personal Dotfiles";

  inputs = {
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
  };

  outputs = { self, nixpkgs, home-manager, ... } @ inputs: let
    system = "x86_64-linux";
    host = "ayush";
    profile = "ayush";
    username = "ayush";
    pkgs = import nixpkgs {
      inherit system;
      config.allowUnfree = true;
    };
  in
  {
    nixosConfigurations = {
      ayush = nixpkgs.lib.nixosSystem {
        inherit system;
        specialArgs = {
          inherit inputs;
          inherit username;
          inherit host;
          inherit profile;
        };
        modules = [
          ./hosts/ayush/configuration.nix
          home-manager.nixosModules.home-manager {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.ayush = import ./home/ayush.nix;
          }
        ];
      };
    };

    homeConfigurations = {
      ayush = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        modules = [
          ./home/ayush.nix
        ];
      };
    };
  };
}
