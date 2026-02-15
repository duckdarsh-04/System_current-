{ config, pkgs, ... }:
{
  wayland.windowManager.hyprland.settings = {
    general = {
      gaps_in = 5;
      gaps_out = 20;
      border_size = 2;

      "col.active_border" = "rgba(33ccffee) rgba(00ff99ee) 45deg";
      "col.inactive_border" = "rgba(595959aa)";

      resize_on_border = false;
      allow_tearing = false;
      layout = "scrolling";
    };

    plugin = {
      scrolling = {
        column_default_width = "onehalf";
        focus_wrap = false;
        column_widths = "onehalf onethird twothirds onequarter";
      };

      hyprexpo = {
        columns = 3;
        gap_size = 5;
        bg_col = "rgb(111111)";
        workspace_method = "first 1";
      };
    };
    decoration = {
      rounding = 10;
      rounding_power = 2;

      active_opacity = 1.0;
      inactive_opacity = 1.0;

      shadow = {
        enabled = true;
        range = 4;
        render_power = 3;
        color = "rgba(1a1a1aee)";
      };

      blur = {
        enabled = true;
        size = 3;
        passes = 1;
        vibrancy = 0.1696;
      };
    };

    input = {
      kb_layout = "us";
      follow_mouse = 1;
      sensitivity = 0;

      touchpad = {
        natural_scroll = false;
      };
    };

    misc = {
      force_default_wallpaper = 0;
      disable_hyprland_logo = true;
      focus_on_activate = true;
      vfr = true;
    };
  };
}
