{ pkgs, ... }:

{
  # Enable networking
  networking.hostName = "tongfang";
  networking.networkmanager.enable = true;
  users.extraGroups.networkmanager.members = [ "bart" ];
  
  environment.systemPackages = with pkgs; [
    iwgtk
    impala
  ];
}