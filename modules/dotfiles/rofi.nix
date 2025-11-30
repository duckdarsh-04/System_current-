{config, pkgs, ...}: {
programs = {
  rofi = {
    enable = true;
    theme = ./.rofi_themes/style-7.rasi;
       package = pkgs.rofi-wayland;
       extraConfig = {
         modi = "drun,filebrowser,run";
         show-icons = true;
         icon-theme = "Papirus";
         font = "nerd-fonts.inconsolata 14.0";
         drun-display-format = "{icon} {name}";
         display-drun = " Apps";
         display-run = " Run";
         display-filebrowser = " File";
       };
     };
   };
 }

