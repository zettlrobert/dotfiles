{ config, pkgs, lib, ... }:

{
  imports = [
#    ../../desktops/gnome/home.nix
  ];

  home.username = "zero";
  home.homeDirectory = "/home/zero";

  # link the configuration file in current directory to the specified location in home directory
  # home.file.".config/i3/wallpaper.jpg".source = ./wallpaper.jpg;

  # encode the file content in nix configuration file directly
  # home.file.".xxx".text = ''
  #     xxx
  # '';

  # basic configuration of git, please change to your own
  programs.git = {
    enable = true;
    userName = "zettlrobert";
    userEmail = "zettl.robert@gmail.com";
  };

  # ---------------------------------------------------------
  # Configuration
 # home.file."kitty" = {
 #    source = ../../submodules/kitty;
 #    target = ".config/kitty";
 # };

  home.activation."kitty" = lib.hm.dag.entryAfter [ "writeBoundary" ] ''
    ln -sf "$(pwd)/dotfiles/submodules/kitty/" $HOME/.config/kitty
  '';

  home.file."nvim" = {
	  source = builtins.fetchGit {
	  url = "https://github.com/zettlrobert/zeronvim";
      rev = "382b11fff6107d47588f81529d009568630fb389";
	  };
	  target = ".config/nvim";
  };

  # To link and not just copy the direcotry it is important to have a string as path
  home.file."test" = {
      source = config.lib.file.mkOutOfStoreSymlink "../../submodules/test";
      target = ".config/test";
  };


  # ---------------------------------------------------------

  # Packages that should be installed to the user profile.
  home.packages = with pkgs; [
    # archives
    zip
    xz
    unzip

    # utils
    ripgrep # recursively searches directories for a regex pattern
    jq # A lightweight and flexible command-line JSON processor
    # yq-go # yaml processer https://github.com/mikefarah/yq
    fzf # A command-line fuzzy finder

    # networking tools
    # mtr # A network diagnostic tool
    # iperf3
    # dnsutils  # `dig` + `nslookup`
    # ldns # replacement of `dig`, it provide the command `drill`
    # aria2 # A lightweight multi-protocol & multi-source command-line download utility
    # socat # replacement of openbsd-netcat
    # nmap # A utility for network discovery and security auditing
    # ipcalc  # it is a calculator for the IPv4/v6 addresses

    # productivity
    # hugo # static site generator
    # glow # markdown previewer in terminal

    # btop  # replacement of htop/nmon
    # iotop # io monitoring
    # iftop # network monitoring

    # system call monitoring
    # strace # system call monitoring
    # ltrace # library call monitoring
    # lsof # list open files

    # system tools
    sysstat
    lm_sensors # for `sensors` command
    ethtool
    pciutils # lspci
    usbutils # lsusb
  ];

  # starship - an customizable prompt for any shell
  programs.starship = {
    enable = true;
    # custom settings
    settings = {
      add_newline = true;
      aws.disabled = true;
      gcloud.disabled = true;
      # line_break.disabled = true;
    };
  };

  programs.bash = {
    enable = true;
    enableCompletion = true;
  };

  # This value determines the home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update home Manager without changing this value. See
  # the home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "23.05";

  # Let home Manager install and manage itself.
  programs.home-manager.enable = true;
}
