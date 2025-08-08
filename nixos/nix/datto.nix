{ config, pkgs, lib, ... }:

{   
  programs.kitty = {
    enable = true;

    shellIntegration = {
      enableBashIntegration = true;
      enableFishIntegration = true;
    };

    settings = {
      font_family = "FiraCode Nerd Font";
      font_size = 12.5;

      bold_font = "auto";
      italic_font = "auto";
      bold_italic_font = "auto";
      
      touch_scroll_multiplier = 3.0;
      confirm_os_window_close = 0;

      cursor_shape = "beam";
      cursor_blink_interval = -1;

      window_padding_width = 4;
    };
  };

  programs.fish = {
    enable = true;
  };

  programs.starship = {
    enable = true;
    enableBashIntegration = true;
    enableFishIntegration = true;
  };

  
#  home.pointerCursor = 
#    let 
#      getFrom = url: hash: name: {
#          gtk.enable = true;
#          x11.enable = true;
#          name = name;
#          size = 48;
#          package = 
#            pkgs.runCommand "moveUp" {} ''
#              mkdir -p $out/share/icons
#              ln -s ${pkgs.fetchzip {
#                url = url;
#                hash = hash;
#              }} $out/share/icons/${name}
#          '';
#        };
#    in
#      getFrom
#        "https://github.com/ful1e5/fuchsia-cursor/releases/download/v2.0.0/Fuchsia-Pop.tar.gz"
#        "sha256-BvVE9qupMjw7JRqFUj1J0a4ys6kc9fOLBPx2bGaapTk="
#        "Fuchsia-Pop";
        
  home.stateVersion = "25.11";
}
