{
  pkgs,
  config,
  lib,
  ...
}:
{
  #Enable hyprland
  wayland.windowManager.hyprland = {
    enable = true;
    plugins = [
      pkgs.hyprlandPlugins.hyprscrolling
      pkgs.hyprlandPlugins.hyprexpo
    ];

    settings = {
      monitor = ",preferred,auto,auto";
      #Programs
      "$terminal" = "kitty";
      "$fileManager" = "thunar";
      "$menu" = "rofi -show drun";
      "$mainMod" = "SUPER";

      exec-once = [
        "$terminal"
        "waybar"
        "swww-daemon"
        "swww img ~/wallpapers/wallhaven-3lgxx3_1920x1080.png --transition-type slide --transition-fps 60"
        "swayosd-server"
        "hypridle"
        "wl-paste --type text --watch cliphist store"
        "wl-paste --type image --watch cliphist store"
      ];

      #Environment
      env = [
        "XCURSOR_SIZE,42"
        "HYPRCURSOR_SIZE,42"
      ];

      #dwindle = {
      #pseudotile = true;
      #preserve_split = true;
      #};

      master = {
        new_status = "master";
      };

      device = {
        name = "epic-mouse-v1";
        sensitivity = -0.5;
      };

      windowrule = [
        "suppressevent maximize,class:.*"
        "nofocus,class:^$,title:^$,xwayland:1,floating:1,fullscreen:0,pinned:0"

      ];
    };
  };

  imports = [
    ./settings.nix
    ./animations.nix
    ./keybindings.nix
  ];

}
