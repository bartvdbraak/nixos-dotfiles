{ ... }:

{
  # Open ports in the firewall.
  networking.firewall.enable = true;
  networking.firewall.allowedTCPPorts = [ ];
  networking.firewall.allowedUDPPorts = [ 
    5353 # Spotify Connect
  ];
}