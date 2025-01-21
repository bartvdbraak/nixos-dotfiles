{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    thunderbird
    element-desktop
    aws-sam-cli
    awscli2
    gnumake
    cmake
  ];
}