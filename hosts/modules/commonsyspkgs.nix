{ pkgs, config, ... }:

{
  environment.systemPackages = with pkgs; [
    tcpdump
    base16-schemes
    btop
    busybox
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
    unrar-wrapper
    unzip
    wget
    ripgrep
    tree-sitter
    ncdu
    atuin
    sqlite
    bc
    nmap
    lm_sensors
    alejandra
    lazygit
    wget
  ];
}
