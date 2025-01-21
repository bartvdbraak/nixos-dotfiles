{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    azure-cli
    opentofu
    curl
    go-task
    sops
  ];
}