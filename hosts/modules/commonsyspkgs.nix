{ pkgs, config, ... }:

{
  environment.systemPackages = with pkgs; [
    tcpdump
    base16-schemes
    btop
    htop
    cmake
    cargo
    dig
    eza
    file
    fzf
    gcc
    gnumake
    lshw
    nh
    ntfs3g
    progress
    python3
    tailscale
    tmux # move to home.nix
    unrar-wrapper
    unzip
    wget
    xclip
    ripgrep
    tree-sitter
    ncdu
    atuin
    sqlite
    bc
    nmap
    lm_sensors
    alejandra
    wget
    bat # move to home.nix
    phetch # move to home.nix
    amfora # move to home.nix
    neofetch # move to home.nix
    ranger # move to home.nix
    figlet # move to home.nix
    git # move to home.nix
    lolcat # move to home.nix
    cowsay # move to home.nix
    cmatrix # move to home.nix
    hollywood # move to home.nix
    kitty # move to home.nix
    telegram-desktop # move to home.nix
  ];
}
