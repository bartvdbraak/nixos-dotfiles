{ config, pkgs, ... }:

{
  users.users.bart = {
    isNormalUser = true;
    description = "Bart van der Braak";
    extraGroups = [
      "networkmanager"
      "wheel"
      "libvirtd"
      "docker"
      "dialout" # for nanokvm usb
    ];
    packages = with pkgs; [
      vscodium
      ungoogled-chromium
      thunderbird
      fastfetch
      ghostty
      neovim
      logseq
      element-desktop
      cinny-desktop
      signal-desktop
      go-task
      opentofu
      python3
      gnumake
      gccgo
      nodejs_22
      corepack_22
      azure-cli
      sops
      blender
      inkscape
      gimp
      nixfmt-rfc-style
      cloud-utils
      ansible-lint
      zed-editor
    ];
  };

  # Enable discovery of Google Cast and Spotify Connect devices
  networking.firewall.allowedUDPPorts = [ 5353 ];

  nixpkgs.config.permittedInsecurePackages = [
    # Workaround for electron dependency in Logseq
    "electron-27.3.11"
    # Workaround for Cinny to work
    "cinny-unwrapped-4.2.3"
    "cinny-4.2.3"
  ];

  programs._1password.enable = true;
  programs._1password-gui = {
    enable = true;
    # Certain features, including CLI integration and system authentication support,
    # require enabling PolKit integration on some desktop environments (e.g. Plasma).
    polkitPolicyOwners = [ "bart" ];
  };

  # SSH agent configuration
  programs.ssh.startAgent = true;
  programs.ssh.extraConfig = ''
    Host *
      AddKeysToAgent yes
      ServerAliveInterval 60
      ServerAliveCountMax 3
  '';

  # GPG agent configuration
  programs.gnupg.agent.enable = true;
  programs.gnupg.dirmngr.enable = true;

  # Add KVM support
  virtualisation.libvirtd.enable = true;
  programs.virt-manager.enable = true;

  # Add Docker support
  virtualisation.docker = {
    enable = true;
    enableOnBoot = false;
  };
}
