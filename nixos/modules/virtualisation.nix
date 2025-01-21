{ pkgs, ... }:

{
  # Enable Docker
  virtualisation.docker.enable = true;
  virtualisation.docker.rootless = {
    enable = true;
    setSocketVariable = true;
  };
  users.extraGroups.docker.members = [ "bart" ];

  # Add KVM support
  virtualisation.libvirtd.enable = true;
  programs.virt-manager.enable = true;
  users.extraGroups.libvirtd.members = [ "bart" ];

  environment.systemPackages = with pkgs; [
    qemu
    docker-compose
    lazydocker
    docker-credential-helpers
  ];
}