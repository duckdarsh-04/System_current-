#!/usr/bin/env bash
hyprctl binds -j | jq -r '.[] | 
  (if .modmask == 64 then "SUPER" 
   elif .modmask == 65 then "SUPER+SHIFT" 
   elif .modmask == 68 then "SUPER+CTRL"
   elif .modmask == 69 then "SUPER+CTRL+SHIFT"
   elif .modmask == 72 then "SUPER+ALT"
   else "MOD\(.modmask)" end) as $mod |
  "\($mod) + \(.key) → \(.dispatcher) \(.arg)"' | \
rofi -dmenu -i -p "Keybindings" -theme-str 'window {width: 50%;}'
