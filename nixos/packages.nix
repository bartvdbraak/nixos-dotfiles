{
  pkgs,
  inputs,
  config,
  ...
}:

let
  customWallpaper = pkgs.fetchurl {
    url = "https://w.wallhaven.cc/full/2y/wallhaven-2y2wg6.png";
    sha256 = "9c5a0d7e4ed8fc218a5adb1c384e463b1b212397859a9a56be1c47cce27a9820";
  };
in
{
  environment.systemPackages =
    with pkgs;
    with inputs;
    [
      inputs.zen-browser.packages."${system}".default
      firefox
      git
      vim
      wget
      curl
      fzf
      jq
      delta
      unzip
      silver-searcher
      ripgrep
      wl-clipboard-rs
      networkmanager-openvpn
      (pkgs.writeTextDir "share/sddm/themes/breeze/theme.conf.user" ''
        [General]
        background=${customWallpaper}
      '')
      dig
      zig
      spotify
      exfat
      exfatprogs
      remmina
      s3cmd
    ];
}
