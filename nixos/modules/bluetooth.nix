{ pkgs, ... }:

{
  # Only power the Bluetooth controller after logon
  hardware.bluetooth.enable = true;
  hardware.bluetooth.powerOnBoot = false;

  # Use Overskride bluetooth client
  environment.systemPackages = with pkgs; [
    overskride
  ];
}