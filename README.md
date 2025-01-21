This repository is personal and currently doesn't come with any documentation or community-centric promises.

You're allowed to use it in whatever way you see fit but **on your own risk**, see our GLWTS license.

- install nixos
- open terminal and run `nix-shell -p git`
- run `git clone https://github.com/bartvdbraak/nixos-dotfiles.git`
- run `./nixos-dotfiles/dotfiles/symlink.sh` if you want to get all dotfiles in your home
- run `sudo ./nixos-dotfiles/nixos/symlink.sh` if you want get nixos configs in your /etc (it backs up your current)
- run one of the configs to switch to it, e.g. `nixos-rebuild switch --flake .#tongfang`, reboot is recommended
