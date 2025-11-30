{ config, pkgs, ... }:

{
  services.displayManager.defaultSession = "hyprland";      
  programs.hyprland.enable = true;      
  # Optional, hint electron apps to use wayland:
  # environment.sessionVariables.NIXOS_OZONE_WL = "1";
}
