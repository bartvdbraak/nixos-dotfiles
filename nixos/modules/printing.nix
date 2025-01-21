{ ... }:

{
  # Enable CUPS to print documents.
  services.printing.enable = true;
  # Disable browsed: https://discourse.nixos.org/t/newly-announced-vulnerabilities-in-cups
  services.printing.browsed.enable = false;
}