{ config, pkgs, ... }:

{
  # TODO please change the username & home direcotry to your own
  home.username = "zettlrobert";
  home.homeDirectory = "/home/zettlrobert";

  # link the configuration file in current directory to the specified location in home directory
  # home.file.".config/i3/wallpaper.jpg".source = ./wallpaper.jpg;

  # encode the file content in nix configuration file directly
  # home.file.".xxx".text = ''
  #     xxx
  # '';

  # set cursor size and dpi for 4k monitor
#  xresources.properties = {
#    "Xcursor.size" = 16;
#    "Xft.dpi" = 172;
#  };

  # basic configuration of git, please change to your own
  programs.git = {
    enable = true;
    userName = "zettlrobert";
    userEmail = "zettl.robert@gmail.com";
  };

  programs.neovim = {
    enable = true;
    defaultEditor = true;
  };

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

    # set some aliases, feel free to add more or remove some
#    shellAliases = {
#      k = "kubectl";
#      urldecode = "python3 -c 'import sys, urllib.parse as ul; print(ul.unquote_plus(sys.stdin.read()))'";
#      urlencode = "python3 -c 'import sys, urllib.parse as ul; print(ul.quote_plus(sys.stdin.read()))'";
#    };
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
