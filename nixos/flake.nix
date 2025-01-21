{
  description = "Bart's NixOS Configuration";

  inputs = {
      nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
      zen-browser.url = "github:0xc000022070/zen-browser-flake";
  };

  outputs = { nixpkgs, ... } @ inputs:
  {
    nixosConfigurations = {
      default = nixpkgs.lib.nixosSystem {
        specialArgs = { inherit inputs; };
        modules = [
          ./hardware/tongfang.nix
          ./configuration.nix
          ./users.nix
          ./packages.nix
          ./services.nix
        ];
      };

      tongfang = nixpkgs.lib.nixosSystem {
        specialArgs = { inherit inputs; };
        modules = [
          ./hardware/tongfang.nix

          ./modules/kde.nix
          ./modules/battery.nix
          ./modules/bluetooth.nix
          ./modules/bootloader.nix
          ./modules/configuration.nix
          ./modules/creative-tools.nix
          ./modules/devops-tools.nix
          ./modules/display-manager.nix
          ./modules/environment-variables.nix
          ./modules/firewall.nix
          ./modules/fonts.nix
          ./modules/gc.nix
          ./modules/greeter.nix
          ./modules/info-fetchers.nix
          ./modules/internationalisation.nix
          ./modules/keyboard.nix
          ./modules/linux-kernel.nix
          ./modules/lsp.nix
          ./modules/networking.nix
          ./modules/nix-settings.nix
          ./modules/nixpkgs.nix
          ./modules/open-ssh.nix
          ./modules/printing.nix
          ./modules/programming-languages.nix
          ./modules/screen.nix
          ./modules/services.nix
          ./modules/sound.nix
          ./modules/terminal-utils.nix
          ./modules/theme.nix
          ./modules/time.nix
          ./modules/usb.nix
          ./modules/users.nix
          ./modules/utils.nix
          ./modules/virtualisation.nix
          ./modules/vpn.nix
          ./modules/work.nix
        ];
      };

      qemu = nixpkgs.lib.nixosSystem {
        specialArgs = { inherit inputs; };
        modules = [
          ./hardware/qemu.nix

          ./modules/kde.nix
          # ./modules/battery.nix
          # ./modules/bluetooth.nix
          # ./modules/bootloader.nix
          ./modules/configuration.nix
          # ./modules/creative-tools.nix
          # ./modules/devops-tools.nix
          ./modules/display-manager.nix
          # ./modules/environment-variables.nix
          # ./modules/firewall.nix
          # ./modules/fonts.nix
          # ./modules/gc.nix
          ./modules/greeter.nix
          # ./modules/info-fetchers.nix
          # ./modules/internationalisation.nix
          # ./modules/keyboard.nix
          # ./modules/linux-kernel.nix
          # ./modules/lsp.nix
          ./modules/networking.nix
          ./modules/nix-settings.nix
          # ./modules/nixpkgs.nix
          # ./modules/open-ssh.nix
          # ./modules/printing.nix
          # ./modules/programming-languages.nix
          # ./modules/screen.nix
          # ./modules/services.nix
          # ./modules/sound.nix
          # ./modules/terminal-utils.nix
          # ./modules/theme.nix
          # ./modules/time.nix
          # ./modules/usb.nix
          ./modules/users.nix
          # ./modules/utils.nix
          # ./modules/virtualisation.nix
          # ./modules/vpn.nix
          # ./modules/work.nix
        ];
      };
    };
  };
}
