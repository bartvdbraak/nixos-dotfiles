{ pkgs, ... }:

{
  # Define a user account.
  users.users.bart = {
    isNormalUser = true;
    description = "Bart van der Braak";
    extraGroups = [ "networkmanager" "input" "wheel" "video" "audio" "tss" ];
    shell = pkgs.bash;
    packages = with pkgs; [
      spotify
      discord
      vscodium
    ];
  };

  # Change runtime directory size
  services.logind.extraConfig = "RuntimeDirectorySize=8G";
}