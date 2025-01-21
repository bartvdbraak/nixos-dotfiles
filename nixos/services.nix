{ pkgs, ... }:

{
  # Desktop, display and greeter configuration
  services.xserver.enable = true;
  services.displayManager.sddm = {
    enable = true;
    wayland.enable = true;
  };
  services.desktopManager.plasma6.enable = true;

  # Audio system with PipeWire
  # Enable PipeWire and ALSA support
  services.pipewire = {
    enable = true;
    alsa.enable = true;       # Enable ALSA support
    alsa.support32Bit = true; # Support for 32-bit applications
    pulse.enable = true;      # Enable PulseAudio compatibility layer
  };
  
  # Enable libinput for input device handling
  services.libinput.enable = true;

  # Enable security-related service for realtime audio tasks
  security.rtkit.enable = true;
  
  # Enable to update some devices' firmware
  services.fwupd.enable = true;

  # Steam, Tailscale, and other programs/services
  programs.steam.enable = true;
  services.tailscale.enable = true;
  programs.partition-manager.enable = true;

  # Environment variables
  environment.sessionVariables.NIXOS_OZONE_WL = "1";

  # Printing and Bluetooth
  # Disable browsed: https://discourse.nixos.org/t/newly-announced-vulnerabilities-in-cups
  services.printing.enable = true;
  services.printing.browsed.enable = false;
  hardware.bluetooth.enable = true;
}