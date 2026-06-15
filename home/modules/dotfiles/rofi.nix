{
  config,
  pkgs,
  ...
}:
{
  programs = {
    rofi = {
      enable = true;
      package = pkgs.rofi;
      extraConfig = {
        modi = "drun,filebrowser,run";
        show-icons = true;
        icon-theme = "Papirus";
        font = "nerd-fonts.inconsolata 14.0";
        drun-display-format = "{icon} {name}";
        display-drun = "  Apps";
        display-run = "  Run";
        display-filebrowser = "  File";
      };
      theme =
        let
          inherit (config.lib.formats.rasi) mkLiteral;
        in
        {
          "*" = {
            background = mkLiteral "#${config.lib.stylix.colors.base00}";
            background-alt = mkLiteral "#${config.lib.stylix.colors.base01}";
            foreground = mkLiteral "#${config.lib.stylix.colors.base05}";
            selected = mkLiteral "#${config.lib.stylix.colors.base02}";
            active = mkLiteral "#${config.lib.stylix.colors.base0D}";
            urgent = mkLiteral "#${config.lib.stylix.colors.base08}";
          };
          "window" = {
            location = mkLiteral "center";
            anchor = mkLiteral "center";
            fullscreen = false;
            width = mkLiteral "400px";
            border-radius = mkLiteral "20px";
            background-color = mkLiteral "@background";
          };
          "mainbox" = {
            enabled = true;
            spacing = mkLiteral "0px";
            background-color = mkLiteral "transparent";
            orientation = mkLiteral "vertical";
            children = map mkLiteral [
              "inputbar"
              "listbox"
            ];
          };
          "listbox" = {
            spacing = mkLiteral "20px";
            padding = mkLiteral "20px";
            background-color = mkLiteral "transparent";
            orientation = mkLiteral "vertical";
            children = map mkLiteral [
              "message"
              "listview"
              "mode-switcher"
            ];
          };
          "inputbar" = {
            enabled = true;
            spacing = mkLiteral "10px";
            padding = mkLiteral "100px 40px";
            background-color = mkLiteral "transparent";
            background-image = mkLiteral "url('/etc/nixos/home/modules/dotfiles/.rofi_themes/rofi_images/style-7.png', width)";
            text-color = mkLiteral "@foreground";
            orientation = mkLiteral "horizontal";
            children = map mkLiteral [
              "textbox-prompt-colon"
              "entry"
            ];
          };
          "textbox-prompt-colon" = {
            enabled = true;
            expand = false;
            str = "🔍";
            padding = mkLiteral "12px 15px";
            border-radius = mkLiteral "100%";
            background-color = mkLiteral "@background-alt";
            text-color = mkLiteral "inherit";
          };
          "entry" = {
            enabled = true;
            expand = true;
            padding = mkLiteral "12px 16px";
            border-radius = mkLiteral "100%";
            background-color = mkLiteral "@background-alt";
            text-color = mkLiteral "inherit";
            cursor = mkLiteral "text";
            placeholder = "Search";
            placeholder-color = mkLiteral "inherit";
          };
          "mode-switcher" = {
            enabled = true;
            spacing = mkLiteral "10px";
            background-color = mkLiteral "transparent";
            text-color = mkLiteral "@foreground";
          };
          "button" = {
            padding = mkLiteral "12px";
            border-radius = mkLiteral "100%";
            background-color = mkLiteral "@background-alt";
            text-color = mkLiteral "inherit";
            cursor = mkLiteral "pointer";
          };
          "button selected" = {
            background-color = mkLiteral "@selected";
            text-color = mkLiteral "@foreground";
          };
          "listview" = {
            enabled = true;
            columns = 1;
            lines = 5;
            cycle = true;
            dynamic = true;
            scrollbar = false;
            layout = mkLiteral "vertical";
            reverse = false;
            fixed-height = true;
            fixed-columns = true;
            spacing = mkLiteral "10px";
            background-color = mkLiteral "transparent";
            text-color = mkLiteral "@foreground";
          };
          "element" = {
            enabled = true;
            spacing = mkLiteral "10px";
            padding = mkLiteral "12px";
            border-radius = mkLiteral "100%";
            background-color = mkLiteral "transparent";
            text-color = mkLiteral "@foreground";
            cursor = mkLiteral "pointer";
          };
          "element selected.normal" = {
            background-color = mkLiteral "@selected";
            text-color = mkLiteral "@foreground";
          };
          "element-icon" = {
            background-color = mkLiteral "transparent";
            text-color = mkLiteral "inherit";
            size = mkLiteral "32px";
          };
          "element-text" = {
            background-color = mkLiteral "transparent";
            text-color = mkLiteral "inherit";
            vertical-align = mkLiteral "0.5";
            horizontal-align = mkLiteral "0.0";
          };
          "message" = {
            background-color = mkLiteral "transparent";
          };
          "textbox" = {
            padding = mkLiteral "12px";
            border-radius = mkLiteral "100%";
            background-color = mkLiteral "@background-alt";
            text-color = mkLiteral "@foreground";
            vertical-align = mkLiteral "0.5";
            horizontal-align = mkLiteral "0.0";
          };
        };
    };
  };
}
