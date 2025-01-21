{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    thunderbird
    element-desktop
    gnumake
    cmake
  ];
}