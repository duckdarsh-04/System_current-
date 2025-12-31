# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix
  ];

  # Bootloader.
  boot.loader.grub.enable = true;
  boot.loader.grub.device = "/dev/disk/by-id/ata-CT500BX500SSD1_2507E9A883D5";
  boot.loader.grub.useOSProber = true;
  networking.hostName = "nixos-server"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager.enable = true;
  boot.kernel.sysctl = {
    "net.ipv6.conf.default.forwarding" = 1;
    "net.ipv6.conf.all.forwarding" = 1;
  };

  # Set your time zone.
  time.timeZone = "Asia/Kolkata";

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
  # You can disable this if you're only using the Wayland session.
  services.xserver.enable = true;

  # Enable the KDE Plasma Desktop Environment.
  services.displayManager.sddm.enable = false;
  services.desktopManager.plasma6.enable = false;
  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  # Enable CUPS to print documents.
  services.printing.enable = false;

  # Enable sound with pipewire.
  services.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    # If you want to use JACK applications, uncomment this
    #jack.enable = true;

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
      "docker"
      "transmission"
      "jellyfin"
    ];
  };
  users.users.mindhunter = {
    isNormalUser = true;
    description = "mindhunter";
    extraGroups = [
      "networkmanager"
      "wheel"
      "transmission"
    ];
  };

  #home manager config
  home-manager.useGlobalPkgs = true;
  home-manager.useUserPackages = true;
  home-manager.backupFileExtension = "hm.bk.duck";
  home-manager.users.duckdarsh = import ../../home/nixos-server/duckdarsh/home.nix;
  home-manager.users.mindhunter = import ../../home/nixos-server/mindhunter/home.nix;

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  #Flake reference for NH
  environment.sessionVariables = {
    NH_FLAKE = "/etc/nixos";
  };

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    openssh
    sshguard
    zoxide
    docker-compose
    adguardhome
    unbound
    busybox # move to commonnixpkgs
    transmission_4
    iptables # setup under security is required
    openvpn
    jellyfin
    jellyfin-web
    jellyfin-ffmpeg
    python3
    virtualenv
    w3m
    openssl
    syncthing
    wakeonlan
    ethtool
    fail2ban
  ];

  # Experimental features enabled
  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  # jellyfin
  services.jellyfin.enable = true;
  # Tailscale
  services.tailscale.enable = true;
  # adguard home
  services.adguardhome.enable = true;
  services.adguardhome.port = 8083;
  services.adguardhome.mutableSettings = false;
  services.adguardhome.settings = {
    dns.bind_port = 53;
    dns.bind_hosts = [ "192.168.0.121" ];
    dns.bootstrap_dns = [
      "1.1.1.1"
      "8.8.8.8"
    ];
    http.address = "192.168.0.121:8083";
  };

  # Transmission daemon service enabled
  services.transmission = {
    enable = true;
    openRPCPort = false;
    settings = {
      #rpc-bind-address = "0.0.0.0";
      download-dir = "/home/duckdarsh/movies";
      watch-dir = "/home/duckdarsh/transmission-watch-dir";
      watch-dir-enabled = true;
    };
  };

  # Enable cron service
  services.cron = {
    enable = true;
    systemCronJobs = [
      "* * * * * 	duckdarsh 	/home/duckdarsh/.bin/transmission_magnet"
      "0 2 * * *        root            /run/current-system/sw/bin/mountpoint -q /mnt/disk2 && /run/current-system/sw/bin/rsync -aAXHv --inplace --partial --mkpath --delete /home/duckdarsh/docker-compose_applicatons/ /mnt/disk2/docker-compose_applications/ >> /home/duckdarsh/rsync-backup.log 2>&1"
    ];
  };
  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "25.05"; # Did you read the comment?

}
