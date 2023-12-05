{  config, pkgs, ...}:

{
  services.xserver.enable = true; # Might need this for Xwayland 
  services.xserver.displayManager.gdm.enable = true;
  services.xserver.desktopManager.gnome.enable = true;

  # Enable automatic login for the user.
  services.xserver.displayManager.autoLogin.enable = true;
  services.xserver.displayManager.autoLogin.user = "vm";

  # Workaround for GNOME autologin: https://github.com/NixOS/nixpkgs/issues/103746#issuecomment-945091229
  systemd.services."getty@tty1".enable = false;
  systemd.services."autovt@tty1".enable = false;

  # Configure keymap in X11
  services.xserver = {
    layout = "us";
    xkbVariant = "";
  };

  # Audio
  hardware.pulseaudio.enable = false;
  sound.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    jack.enable = true;
  };

  # rtkit is optional but recommended
  security.rtkit.enable = true;

  # Gnome settings uses dconf to change settings
  programs.dconf.enable = true;

  # Advanced configuration with gnome-twweaks
  environment.systemPackages = with pkgs; [
    gnome.gnome-tweaks
  ];
}
