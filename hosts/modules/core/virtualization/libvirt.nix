{
  config,
  pkgs,
  ...
}: {
  #enable dconf (system management tool)
  programs.dconf.enable = true;

  #libvirtd user group
  users.users.duckdarsh.extraGroups = ["libvirtd"];

  #Required packages
  environment.systemPackages = with pkgs; [
    virt-manager
    virt-viewer
    qemu
    spice
    spice-gtk
    libvirt
    spice-protocol
    virtio-win
    win-spice
    pkgs.adwaita-icon-theme
  ];

  #Manage the virtualisation services
  virtualisation = {
    libvirtd = {
      enable = true;
      qemu = {
        swtpm.enable = true;
      };
    };
    spiceUSBRedirection.enable = true;
  };
  #Enable Spice Guest Agent (for better vm integration)
  services.spice-vdagentd.enable = true;
}
