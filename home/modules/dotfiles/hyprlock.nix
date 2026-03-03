{
  pkgs,
  config,
  ...
}:
{
  programs.hyprlock = {
    enable = true;
    settings = {
      general = {
        disable_loading_bar = true;
        grace = 1;
        hide_cursor = true;
        no_fade_in = false;
      };
      background = [
        {
          path = "/home/duckdarsh/Hyprlock.png";
          blur_passes = 3;
          blur_size = 8;
        }
      ];
      image = [
        {
          path = "/home/duckdarsh/.Hyprlockduck.jpeg";
          size = 150;
          border_size = 4;
          border_color = "rgb(0c96F9)";
          rounding = -1;
          position = "0, -40;";
          halign = "center";
          valign = "center";
        }
      ];
      input-field = [
        {
          size = "200, 50";
          position = "0, -88";
          monitor = "";
          dots_center = true;
          fade_on_empty = false;
          font_colour = "rgb(CFE6F4)";
          inner_color = "rgb(657DC2)";
          outer_color = "rgb(0D0E15)";
          outline_thickness = 5;
          shadow_passes = 2;
          placeholder_text = "quack quack!";
        }
      ];
    };
  };
}
