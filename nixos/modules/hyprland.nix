{ inputs, pkgs, ... }:

{
  # Enable Hyprland
  programs.hyprland.enable = true;
  environment.sessionVariables.NIXOS_OZONE_WL = "1";
  environment.sessionVariables.WLR_NO_HARDWARE_CURSORS = "1";

  environment.systemPackages = with pkgs; [
    pyprland # plugin system
    hyprpicker # color picker
    hyprcursor # cursor format
    hyprlock # lock screen
    hypridle # idle daemon
    hyprpaper # wallpaper util

    inputs.ghostty.packages.${pkgs.system}.default # terminal emulator
    starship # prompt
    helix # txt editor
    inputs.zen-browser.packages.${pkgs.system}.default # browser
    zathura # pdf viewer
    mpv # media player
    imv # image viewer
  ];
}