{
  config,
  lib,
  pkgs,
  ...
}:
{
  stylix.enable = true;
  stylix.base16Scheme = "${pkgs.base16-schemes}/share/themes/catppuccin-mocha.yaml";
  stylix.cursor.package = pkgs.bibata-cursors;
  stylix.cursor.name = "Bibata-Modern-Ice";
  stylix.cursor.size = 48;
  stylix.autoEnable = false;
  stylix.polarity = "dark";
  stylix.fonts = {
    monospace = {
      package = pkgs.nerd-fonts.jetbrains-mono;
      name = "jetBrainsMono Nerd Font Mono";
    };
    serif = {
      package = pkgs.noto-fonts;
      name = "Noto serif";
    };
    sansSerif = {
      package = pkgs.inter;
      name = "Inter";
    };
    emoji = {
      package = pkgs.noto-fonts-emoji;
      name = "Noto Color Emoji";
    };
  };
}
