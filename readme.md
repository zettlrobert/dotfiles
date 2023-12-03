# NixOS Setup

We install nixos with btrfs from the installer, don't selet a DE environment and boot into the system.

## Hosts

| Hostname   | Hardware                              | Description                      | Command                                             |
| ---------- | ------------------------------------- | -------------------------------- | --------------------------------------------------- |
| zerodev    | amd cpu, amd gpu, desktop peripherals | 2023 desktop pc running on nvme0 | `sudo nixos-rebuild switch --flake ./hosts/zerodev` |
| mobilehead | amd cpu, amd gpu, desktop peripherals | 2023 desktop pc running on nvme0 |                                                     |

### Installation

- Install hyprland, firefox set environment variable for `NIXOS_OZONE_WL` and line to enable flakes

- rebuild

- create directory dotfiles and initialize a flake

```bash
nix flake init

# To get a flake with a template of all inputs
nix flake init -t templates#full
```

# To run the flake with the hostname use:

`sudo nixos-rebuild switch --flake /etc/nixos#nixos-test`

## Soundcontrol

- we have the pipewire setup in our configuration.nix
- run `pavucontrol` to open sound settings
- https://nixos.wiki/wiki/PipeWire

## Application Launcher

- We install wofi

## NixOS can only manage system-level configuration!

To manage user-level configuration in the Home directory, we need to install Home Manager.

### Home Manager

- write a custom file for our home manager
- add inputs home-manager and nixpkgs in flake.nix

### Development Setup

#### Nodejs

- add `nodejs_20` to configuration.nix packages

## TODOs

- configure pipewire audio (https://nixos.wiki/wiki/PipeWire)
- configure wofi
- setup codeium on nixos
- dunst configuration
- workspace plugin hyprland (work like in gnome)
- plymouth luks screen
- get sddm theme
- install fonts
- zsh, zap, fzf, terminal setup
- docker setup
- waybar configuration
