{ pkgs, ... }:

{
  # Enable Mullvad VPN, OpenVPN via Network Manager and Tailscale
  services.mullvad-vpn.enable = true;
  services.mullvad-vpn.package = pkgs.mullvad;
  services.tailscale.enable = true;
  environment.systemPackages = with pkgs; [
    networkmanager-openvpn
    mullvad-closest
  ];
}