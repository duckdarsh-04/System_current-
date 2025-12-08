# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).
{
  config,
  pkgs,
  ...
}: {
  imports = [
    ./hardware-configuration.nix
    ./modules/nvidia.nix
    ./modules/fonts.nix
    ./modules/stylix.nix
    ./modules/vm.nix
    ./modules/security.nix
  ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.loader.systemd-boot.configurationLimit = 5;
  boot.kernelPackages = pkgs.linuxPackages_6_12;

  networking.hostName = "nixos"; # Define your hostname.
  #networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant

  # Enable networking
  networking.networkmanager.enable = true;
  networking.resolvconf.enable = true;
  networking.nameservers = [
    "100.100.100.100"
    "100.88.43.124"
    "1.1.1.1"
    "1.0.0.1"
  ];
  networking.networkmanager.dns = "none";

  # Set your time zone.
  #time.timeZone = "europe/London";
  services.automatic-timezoned.enable = true;
  # Select internationalisation properties.
  i18n.defaultLocale = "en_IN";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_IN";
    LC_IDENTIFICATION = "en_IN";
    LC_MEASUREMENT = "en_IN";
    LC_MONETARY = "en_IN";
    LC_NAME = "en_IN";
    LC_NUMERIC = "en_IN";
    LC_PAPER = "en_IN";
    LC_TELEPHONE = "en_IN";
    LC_TIME = "en_IN";
  };

  # Enable the X11 windowing system.
  services.xserver.enable = true;
  #SDDM Configuration
  services.displayManager.sddm.enable = true;
  services.displayManager.sddm.theme = "sddm-astronaut-theme";
  services.displayManager.sddm.wayland.enable = true;
  services.displayManager.sddm.extraPackages = with pkgs; [
    qt6.qtbase
    qt6.qttools
    qt6.qtmultimedia
  ];
  services.displayManager.defaultSession = "hyprland";
  programs.hyprland.enable = true;
  # Enable the KDE Plasma Desktop Environment.
  services.desktopManager.plasma6.enable = false;
  # Enable the i3 Window Manager Environment
  services.xserver.windowManager.i3.enable = false;
  #hyprlock
  security.pam.services.hyprlock = {};
  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  # Enable CUPS to print documents.
  #services.printing.enable = true;

  # Enable sound with pipewire.
  services.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    #If you want to use JACK applications, uncomment this
    #jack.enable = true;

    # use the example session manager (no others are packaged yet so this is enabled by default,
    # no need to redefine it in your config for now)
    #media-session.enable = true;
  };

  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;

  users.users.duckdarsh = {
    isNormalUser = true;
    description = "duckdarsh";
    extraGroups = [
      "networkmanager"
      "wheel"
    ];
    packages = with pkgs; [
    ];
  };

  #home-manager config
  home-manager.useGlobalPkgs = true;
  home-manager.useUserPackages = true;
  home-manager.backupFileExtension = "hm.bk.duck";
  home-manager.users.duckdarsh = import ./home.nix;

  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [
    tcpdump
    base16-schemes
    btop
    busybox
    cmake
    dig
    eza
    file
    flameshot
    fzf
    gamemode
    gcc
    gnumake
    heroic
    jdk11
    lshw
    lutris
    nh
    ntfs3g
    pkgs.javaPackages.openjfx17
    protonplus
    progress
    protonup-qt
    protonvpn-gui
    python312Packages.ds4drv
    python3
    qalculate-qt
    tailscale
    tmux
    unrar-wrapper
    unzip
    vulkan-loader
    vulkan-tools
    wine
    weechat
    wget
    winetricks
    evince
    xclip
    ripgrep
    tree-sitter
    nodejs_20
    hugo
    ncdu
    neomutt
    atuin
    sqlite
    bc
    hyprland
    hyprlandPlugins.hyprscrolling
    xwayland
    nmap
    asusctl
    xfce.thunar
    gvfs
    xfce.tumbler
    sddm-astronaut
    libimobiledevice
    alejandra

    bibata-cursors
    mangohud
    telegram-desktop
    zapzap
    papirus-icon-theme
  ];

  #permitted Insecure Packages
  nixpkgs.config.permittedInsecurePackages = [
    "gradle-7.6.6"
  ];

  #Flake reference for nh
  environment.sessionVariables = {
    NH_FLAKE = "/etc/nixos";
  };

  #Gaming
  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true;
    dedicatedServer.openFirewall = true;
    localNetworkGameTransfers.openFirewall = true;
  };

  #gamemode
  programs.gamemode.enable = true;
  #Bluetooth configuration
  hardware.bluetooth.enable = true;
  hardware.bluetooth.powerOnBoot = true;
  #experimental features enabled
  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  #services enable
  #atuin
  services.atuin.enable = true;
  #tailscale
  services.tailscale.enable = true;
  #xwayland
  programs.xwayland.enable = true;
  #Asusd
  services.asusd.enable = true;
  services.asusd.enableUserService = true;
  #sshd
  services.openssh.enable = false;
  #gvfs for thunar
  services.gvfs.enable = true;
  #thunar plugins and tumbler
  services.tumbler.enable = true;
  programs.thunar = {
    enable = true;
    plugins = with pkgs.xfce; [
      thunar-archive-plugin
      thunar-volman
      thunar-media-tags-plugin
    ];
  };

  #enabling nix-index
  programs.command-not-found.enable = false;
  programs.nix-index.enable = true;
  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "24.11"; # Did you read the comment?
}
