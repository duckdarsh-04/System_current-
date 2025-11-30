{ config, pkgs, ... }:


{
  fonts.enableDefaultPackages = true;

  fonts.packages = with pkgs; [
   nerd-fonts.inconsolata    
   nerd-fonts.monaspace
   nerd-fonts.jetbrains-mono
  ];
}
