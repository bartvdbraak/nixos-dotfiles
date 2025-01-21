{ pkgs, ... }:

{
  services.xserver = {
    xkb.layout = "us";
    xkb.options = "grp:alt_shift_toggle";
  };

  environment.systemPackages = with pkgs; [
    klavaro # typing tutor
    gtypist # typing tutor
    via # keyboard configurator
  ];
}