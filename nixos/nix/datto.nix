{ ... }:
{
  programs.kitty = {
    enable = true;

    shellIntegration = {
      enableBashIntegration = true;
      enableFishIntegration = true;
    };

    settings = {
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

  home.stateVersion = "25.11";
}
