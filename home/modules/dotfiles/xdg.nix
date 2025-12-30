{pkgs, ...}: {
  xdg = {
    enable = true;
    mime.enable = true;
    mimeApps.enable = false;
    portal = {
      enable = true;
      extraPortals = [pkgs.xdg-desktop-portal-hyprland pkgs.kdePackages.xdg-desktop-portal-kde pkgs.xdg-desktop-portal-gtk];
      configPackages = [pkgs.hyprland pkgs.kdePackages.xdg-desktop-portal-kde pkgs.i3];
    };
  };
}
