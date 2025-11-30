{config, pkgs, lib, ...}: {

programs.waybar = {
  enable = true;
  settings = [
    {
      clock24h = false;
      layer = "top";
      position = "top";
      modules-center = ["hyprland/workspaces"];
      modules-left = [
        "custom/startmenu"
        "custom/arrow6"
        "pulseaudio"
        "cpu"
        "memory"
        "idle_inhibitor"
        "custom/arrow7"
        "hyprland/window"    
      ];
      modules-right = [
        "custom/arrow4"
        "custom/keybindings"
        "custom/arrow3"
        "custom/notification"
        "custom/arrow3"
        "custom/exit"
        "battery"
        "custom/arrow2"
        "tray"
        "custom/arrow1"
        "clock"
      ];
      "hyprland/workspaces" = {
            format = "{name}";
            format-icons = {
              default = "";
              active = "";
              urgent = "";
            };
            on-scroll-up = "hyprctl dispatch workspace e+1";
            on-scroll-down = "hyprctl dispatch workspace e-1";
          };
          "clock" = {
            format = " {:%I:%M %p}";
            interval = 60;
            tooltip = true;
            tooltip-format = "<big>{:%A, %d %B %Y}</big>"; 
          };
          "hyprland/window" = {
            max-length = 22;
            separate-outputs = false;
            rewrite = {
              "" = " 🙈 No Windows? ";
            };
          };
          "memory" = {
            interval = 5;
            format = " {}%";
            tooltip = true;
          };
          "cpu" = {
            interval = 5;
            format = " {usage:2}%";
            tooltip = true;
          };
          "disk" = {
            format = " {free}";
            tooltip = true;
          };
          "network" = {
            format-icons = [
              "󰤯"
              "󰤟"
              "󰤢"
              "󰤥"
              "󰤨"
            ];
            format-ethernet = " {bandwidthDownOctets}";
            format-wifi = "{icon} {signalStrength}%";
            format-disconnected = "󰤮";
            tooltip = false;
          };
          "tray" = {
            spacing = 12;
          };
          "pulseaudio" = {
            format = "{icon} {volume}% {format_source}";
            format-bluetooth = "{volume}% {icon} {format_source}";
            format-bluetooth-muted = " {icon} {format_source}";
            format-muted = " {format_source}";
            format-source = " {volume}%";
            format-source-muted = "";
            format-icons = {
              headphone = "";
              hands-free = "";
              headset = "";
              phone = "";
              portable = "";
              car = "";
              default = [
                ""
                ""
                ""
              ];
            };
            on-click = "sleep 0.1 && pavucontrol";
          };
          "custom/exit" = {
            tooltip = false;
            format = "";
            on-click = "sleep 0.1 && wlogout";
          };
          "custom/startmenu" = {
            tooltip = false;
            format = "";
            on-click = "sleep 0.1 && rofi -show drun";
          };
          "custom/keybindings" = {
            tooltip = false;
            format = "󱕴";
            on-click = "sleep 0.1 && list-keybinds";
          };
          "idle_inhibitor" = {
            format = "{icon}";
            format-icons = {
              activated = "";
              deactivated = "";
            };
            tooltip = "true";
          };
          "custom/notification" = {
            tooltip = false;
            format = "{icon} {}";
            format-icons = {
              notification = "<span foreground='red'><sup></sup></span>";
              none = "";
              dnd-notification = "<span foreground='red'><sup></sup></span>";
              dnd-none = "";
              inhibited-notification = "<span foreground='red'><sup></sup></span>";
              inhibited-none = "";
              dnd-inhibited-notification = "<span foreground='red'><sup></sup></span>";
              dnd-inhibited-none = "";
            };
            return-type = "json";
            exec-if = "which swaync-client";
            exec = "swaync-client -swb";
            on-click = "swaync-client -t -sw";
            escape = true;
          };
          "battery" = {
            states = {
              warning = 30;
              critical = 15;
            };
            format = "{icon} {capacity}%";
            format-charging = "󰂄 {capacity}%";
            format-plugged = "󱘖 {capacity}%";
            format-icons = [
              "󰁺"
              "󰁻"
              "󰁼"
              "󰁽"
              "󰁾"
              "󰁿"
              "󰂀"
              "󰂁"
              "󰂂"
              "󰁹"
            ];
            on-click = "";
            tooltip = false;
          };
          "custom/arrow1" = {
            format = "";
          };
          "custom/arrow2" = {
            format = "";
          };
          "custom/arrow3" = {
            format = "";
          };
          "custom/arrow4" = {
            format = "";
          };
          "custom/arrow5" = {
            format = "";
          };
          "custom/arrow6" = {
            format = "";
          };
          "custom/arrow7" = {
            format = "";
          };
        }
      ];
      
     style = lib.concatStrings [
       ''
         * {
           font-family: JetBrainsMono Nerd Font Mono;
           font-size: 14px;
           border: none;
           border-radius: 12px;
           min-height: 0px;
           margin: 2px;
         }

         window#waybar {
           background: transparent;
           color: #${config.lib.stylix.colors.base05};
           border-radius: 0;
           padding: 0;
           box-shadow: none;
        }

        tooltip {
          background: rgba(0, 0, 0, 0.7);
          border: 1px solid #${config.lib.stylix.colors.base05};
          border-radius: 8px;
        }
        
        tooltip label {
          color: #${config.lib.stylix.colors.base05};
        }

        #workspaces button {
          padding: 4px 6px;
          margin: 2px;
          background: transparent;
          color: #${config.lib.stylix.colors.base04};
          border-radius: 8px;
        }

        #workspaces button.active {
          background: rgba(255, 255, 255, 0.1);
          color: #${config.lib.stylix.colors.base0D};
        }

        #workspaces button:hover {
          background: rgba(255, 255, 255, 0.2);
          color: #${config.lib.stylix.colors.base08};
        }

        #clock, #window, #memory, #cpu, #disk, #battery, #network, #pulseaudio, #tray, #custom-startmenu, #custom-exit, #custom-notification, #idle_inhibitor, #custom-keybindings {
         padding: 4px 10px;
         margin: 0 3px;
         background: rgba(255, 255, 255, 0.05); /* Light glass effect */
         color: #${config.lib.stylix.colors.base06};
         border-radius: 10px;
       }

       #clock {
         font-weight: bold;
         background: rgba(255, 255, 255, 0.1);
         color: #${config.lib.stylix.colors.base07};
       }

       #pulseaudio.muted {
         color: #${config.lib.stylix.colors.base08};
       }

       #tray {
         padding: 4px 6px;
       }

       #custom-startmenu {
         font-size: 18px;
         background: rgba(255, 255, 255, 0.08);
         color: #${config.lib.stylix.colors.base0B};
       }

       #custom-exit {
         font-size: 18px;
         background: rgba(255, 0, 0, 0.2);
         color: #${config.lib.stylix.colors.base08};
       }

       #custom-notification {
         background: rgba(255, 255, 255, 0.1);
         color: #${config.lib.stylix.colors.base0E};
       }

       #idle_inhibitor {
         background: rgba(255, 255, 255, 0.08);
         color: #${config.lib.stylix.colors.base0C};
       }
   ''];
  };
}



