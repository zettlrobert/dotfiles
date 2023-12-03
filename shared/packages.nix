{ config, pkgs, ...}:

{
  # List of common packages
  environment.systemPackages = with pkgs; [
    vim
    git
    kitty
    wget
    curl
    unzip
    gzip
    gettext # GNU build tool
    firefox
    zsh
    wofi
    waybar
    pavucontrol
    bitwarden
    nodejs_20
    lua
    tree-sitter
    gcc
    coreutils
    neovim
    polkit-kde-agent # authentication agent
    dunst # notificaiton daemon
    wireplumber # modular session policy manager for pipewire
    xdg-desktop-portal-hyprland # xdg-desktop-portal backend for hyprland
    gnome.gnome-tweaks # Gnome Tweaks
    fzf
    xclip # This is not wayland compatible
    nerdfonts
    nodePackages.prettier # for formatting todo: this has to be moved to neovim
  ];
}
