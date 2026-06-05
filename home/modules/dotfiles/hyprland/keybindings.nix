{ config, pkgs, ... }:
{
  wayland.windowManager.hyprland.settings = {
    bind = [
      # Main bindings
      "$mainMod, RETURN, exec, $terminal"
      "$mainMod, Q, killactive,"
      "$mainMod SHIFT, E, exit,"
      "$mainMod, F, exec, $fileManager"
      "$mainMod, V, togglefloating,"
      "$mainMod, D, exec, $menu"
      "$mainMod, P, pseudo,"
      "$mainMod, J, layoutmsg, togglesplit"

      # Custom scripts and tools
      "$mainMod SHIFT, W, exec, /etc/nixos/home/modules/dotfiles/hyprland/scripts/wallpaper.sh"
      "$mainMod SHIFT, X, exec, wlogout"
      "$mainMod, S, exec, hyprshot -m window | wl-copy"
      "$mainMod SHIFT, S, exec, hyprshot -m region | wl-copy"
      "$mainMod SHIFT, F, fullscreen"
      "$mainMod, L, exec, hyprlock"
      "$mainMod SHIFT, C, exec, cliphist list | rofi -dmenu | cliphist decode | wl-copy"
      # Move windows
      "$mainMod, period, layoutmsg, colresize +0.1"
      "$mainMod CTRL, period, layoutmsg, colresize -0.1"
      "$mainMod, comma, layoutmsg, swapcol l"
      "$mainMod, period, layoutmsg, swapcol r"
      "$mainMod SHIFT, comma, layoutmsg, move l"
      "$mainMod SHIFT, period, layoutmsg, move r"
      # Hyprexpo
      #"$mainMod, TAB, hyprexpo:expo, toggle"
      # Focus movement
      "$mainMod, left, movefocus, l"
      "$mainMod, right, movefocus, r"
      "$mainMod, up, movefocus, u"
      "$mainMod, down, movefocus, d"
      # Workspace switching
      "$mainMod, 1, workspace, 1"
      "$mainMod, 2, workspace, 2"
      "$mainMod, 3, workspace, 3"
      "$mainMod, 4, workspace, 4"
      "$mainMod, 5, workspace, 5"
      "$mainMod, 6, workspace, 6"
      "$mainMod, 7, workspace, 7"
      "$mainMod, 8, workspace, 8"
      "$mainMod, 9, workspace, 9"
      "$mainMod, 0, workspace, 10"

      # Move windows to workspace
      "$mainMod SHIFT, 1, movetoworkspace, 1"
      "$mainMod SHIFT, 2, movetoworkspace, 2"
      "$mainMod SHIFT, 3, movetoworkspace, 3"
      "$mainMod SHIFT, 4, movetoworkspace, 4"
      "$mainMod SHIFT, 5, movetoworkspace, 5"
      "$mainMod SHIFT, 6, movetoworkspace, 6"
      "$mainMod SHIFT, 7, movetoworkspace, 7"
      "$mainMod SHIFT, 8, movetoworkspace, 8"
      "$mainMod SHIFT, 9, movetoworkspace, 9"
      "$mainMod SHIFT, 0, movetoworkspace, 10"

      # Scratchpad (moved from S to grave/backtick to avoid conflict)
      "$mainMod, grave, togglespecialworkspace, magic"
      "$mainMod SHIFT, grave, movetoworkspace, special:magic"

      # Workspace scrolling
      "$mainMod, mouse_down, workspace, e+1"
      "$mainMod, mouse_up, workspace, e-1"
    ];

    # Mouse bindings
    bindm = [
      "$mainMod, mouse:272, movewindow"
      "$mainMod, mouse:273, resizewindow"
    ];

    # Volume and brightness (repeatable)
    bindel = [
      ",XF86AudioRaiseVolume, exec, swayosd-client --output-volume raise"
      ",XF86AudioLowerVolume, exec, swayosd-client --output-volume lower"
      ",XF86AudioMute, exec, swayosd-client --output-volume mute-toggle"
      ",XF86AudioMicMute, exec, wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"
      ",XF86MonBrightnessUp, exec, swayosd-client --brightness raise"
      ",XF86MonBrightnessDown, exec, swayosd-client --brightness lower"
      ",XF86KbdBrightnessUp, exec, asusctl -n"
      ",XF86KbdBrightnessDown, exec, asusctl -p"
      ",XF86Launch3, exec, asusctl aura -n"
      ",XF86Launch4, exec, asusctl profile -n && notify-send 'Profile' \"$(asusctl profile -p | grep 'Active profile' | awk '{print $NF}')\""
      ",XF86Launch1, exec, rog-control-center"
    ];

    # Media controls (non-repeatable)
    bindl = [
      ", XF86AudioNext, exec, playerctl next"
      ", XF86AudioPause, exec, playerctl play-pause"
      ", XF86AudioPlay, exec, playerctl play-pause"
      ", XF86AudioPrev, exec, playerctl previous"
    ];
  };
}
