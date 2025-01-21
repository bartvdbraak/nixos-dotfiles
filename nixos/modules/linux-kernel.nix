{ pkgs, ... }:

{
  # Linux Kernel
  boot.kernelPackages = pkgs.linuxKernel.packages.linux_zen;
  boot.kernelParams = [ 
    "splash"
    "quiet"
    "fbcon=nodefer"
    "vt.global_cursor_default=0"
    "kernel.modules_disabled=1"
    "lsm=landlock,lockdown,yama,integrity,bpf,tomoyo"
    "usbcore.autosuspend=-1"
    "video4linux"
    "acpi_rev_override=5"
  ];

  environment.systemPackages = with pkgs; [
    policycoreutils
  ];
}