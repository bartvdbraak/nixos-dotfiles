{
  description = "Bart's NixOS Configuration";

  inputs = {
    zen-browser.url = "github:0xc000022070/zen-browser-flake";
  };

  outputs =
    { nixpkgs, ... }@inputs:
    {
      nixosConfigurations = {
        tongfang = nixpkgs.lib.nixosSystem {
          specialArgs = { inherit inputs; };
          modules = [
            ./hardware/tongfang.nix
            ./configuration.nix
            ./users.nix
            ./packages.nix
            ./services.nix
            ./modules/bootloader.nix
            ./modules/apple-fonts.nix
          ];
        };
        qemu = nixpkgs.lib.nixosSystem {
          specialArgs = { inherit inputs; };
          modules = [
            ./hardware/qemu.nix
            ./modules/kde.nix
            ./modules/configuration.nix
            ./modules/display-manager.nix
            ./modules/greeter.nix
            ./modules/networking.nix
            ./modules/nix-settings.nix
            ./modules/users.nix
          ];
        };
      };
    };
}
