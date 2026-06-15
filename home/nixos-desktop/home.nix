{
  config,
  pkgs,
  pkgs-unstable,
  ...
}:
{
  imports = [
    ../modules/dotfiles/bash.nix
    ../modules/dotfiles/kitty.nix
    ../modules/dotfiles/htop.nix
    ../modules/dotfiles/waybar.nix
    ../modules/dotfiles/rofi.nix
    ../modules/dotfiles/ranger.nix
    ../modules/dotfiles/swaync.nix
    ../modules/dotfiles/hyprlock.nix
    ../modules/dotfiles/hypridle.nix
    ../modules/dotfiles/xdg.nix
    ../modules/dotfiles/cava.nix
    #../modules/dotfiles/obsidian.nix
    ../modules/dotfiles/hyprland/default.nix
  ];

  home.username = "duckdarsh";
  home.homeDirectory = "/home/duckdarsh";
  home.stateVersion = "24.11";
  home.packages =
    (with pkgs; [
      aria2
      audacity
      discord
      localsend
      htop
      cmatrix
      brave
      kitty
      kitty-themes
      vlc
      fastfetch
      ranger
      pavucontrol
      starship
      waybar
      rofi
      brightnessctl
      swaybg
      hyprlock
      hypridle
      hyprshot
      wlogout
      awww
      wl-clipboard
      onlyoffice-desktopeditors
      swayosd
      teams-for-linux
      obsidian
      sl
      magic-wormhole
      amfora
      cava
      spotify
      ryubing
      swaynotificationcenter
      git
      keepassxc
      cliphist
      wl-clip-persist
      nwg-clipman
      tmux
      zapzap
      telegram-desktop
      imv
      libnotify
      pandoc
      jasp-desktop
      bun
      fladder
      jellyfin-desktop
    ])

    ++ (with pkgs-unstable; [

    ]);

  programs.home-manager.enable = true;
  programs.starship.enable = true;
  programs.keychain = {
    enable = true;
    keys = [ "id_ed25519" ];
  };
  services.dark-send.enable = true;

  programs.git = {
    enable = true;
    settings.user.name = "duckdarsh-04";
    settings.user.email = "mdarshan2004@gmail.com";
    settings.init.defaultBranch = "main";
    settings.safe.directory = [ "/etc/nixos" ];
  };

  services.swayosd.enable = true;
  stylix.targets.gtk.enable = true;
  gtk.gtk4.theme = config.gtk.theme;
  stylix.targets.qt.enable = false;
}
