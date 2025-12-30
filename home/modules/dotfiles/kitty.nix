{
  config,
  pkgs,
  ...
}: {
  programs.kitty = {
    enable = true;

    font = {
      name = "nerd-fonts.inconsolata";
      size = 14;
    };

    themeFile = "Catppuccin-Mocha";

    settings = {
      wheel_scroll_min_lines = 1;
      window_padding_width = 4;
      confirm_os_window_close = 0;
      scrollback_lines = 20000;
      enable_audio_bell = false;
      background_opacity = "0.90";
      cursor_trail = 3;
      cursor_blink_soft = true;
      cursor_stop_blinking_after = 0;
      cursor_shape = "beam";
      cursor_beam_thickness = 4;
      cursor_underline_thickness = 2.0;
      cursor_blink_interval = 0.5;
      cursor = "#f2cdcd";
      detect_urls = true;
      url_color = "#0087bd";
      url_style = "curly";
    };
  };
}
