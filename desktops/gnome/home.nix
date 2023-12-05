{ pkgs, ... }: 

{
  gtk = {
    enable = true;

    theme = {
      name = "Catppuccin-Mocha-Compact-Teal-Dark";
      package = pkgs.catppuccin-gtk.override {
        accents = [ "teal" ];
        size = "compact";
        tweaks = [ "rimless" "black" ];
        variant = "mocha";
      };
    };

    gtk3.extraConfig = {
      Settings = ''
        gtk-application-prefer-dark-theme=1
      '';
    };

    gtk4.extraConfig = {
      Settings = ''
        gtk-application-prefer-dark-theme=1
      '';
    };

    home.sessionVariables.GTK_THEME = "Catppuccin-Mocha-Compact-Teal-Dark";
  };
}
