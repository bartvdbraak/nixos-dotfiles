{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    blender
    inkscape
    gimp
  ];
}