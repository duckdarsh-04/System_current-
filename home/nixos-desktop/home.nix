{
  config,
  pkgs,
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
    ../modules/dotfiles/hyprland/default.nix
  ];

  home.username = "duckdarsh";
  home.homeDirectory = "/home/duckdarsh";

  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "24.11"; # Please read the comment before changing.

  home.packages = with pkgs; [
    aria2
    audacity
    discord
    localsend
    htop
    hollywood
    lolcat
    cmatrix
    brave
    phetch
    kitty
    kitty-themes
    vlc
    neofetch
    ranger
    nudoku
    pavucontrol
    starship
    undollar
    waybar
    rofi
    brightnessctl
    swaybg
    hyprlock
    hypridle
    hyprshot
    wlogout
    swww
    w3m
    wl-clipboard
    libreoffice
    impala
    swayosd
    teams-for-linux
    obsidian
    dmidecode
    sl
    burpsuite
    magic-wormhole
    amfora
    cava
    spotify
    jellyfin-media-player
    ryubing
    swaynotificationcenter
    git
    mailspring
    keepassxc
    cliphist
    wl-clip-persist
    nwg-clipman
    zotero
    morgen
    tmux
    zapzap
    telegram-desktop
  ];

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
    # # Building this configuration will create a copy of 'dotfiles/screenrc' in
    # # the Nix store. Activating the configuration will then make '~/.screenrc' a
    # # symlink to the Nix store copy.
    # ".screenrc".source = dotfiles/screenrc;

    # # You can also set the file content immediately.
    # ".gradle/gradle.properties".text = ''
    #   org.gradle.console=verbose
    #   org.gradle.daemon.idletimeout=3600000
    # '';
  };

  # Home Manager can also manage your environment variables through
  # 'home.sessionVariables'. These will be explicitly sourced when using a
  # shell provided by Home Manager. If you don't want to manage your shell
  # through Home Manager then you have to manually source 'hm-session-vars.sh'
  # located at either
  #
  #  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  ~/.local/state/nix/profiles/profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  /etc/profiles/per-user/duckdarsh/etc/profile.d/hm-session-vars.sh
  #
  home.sessionVariables = {
    # EDITOR = "emacs";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
  programs.starship.enable = true;
  programs.git = {
    enable = true;
    settings.user.name = "duckdarsh-04";
    settings.user.email = "mdarshan2004@gmail.com";
    settings.init.defaultBranch = "main";
  };
  services.swayosd.enable = true;
}
