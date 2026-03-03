#!/usr/bin/env bash

WALLPAPER_DIR="$HOME/wallpapers"
LAST_WALLPAPER_FILE="/tmp/last_wallpaper"

LAST=$(cat "$LAST_WALLPAPER_FILE" 2>/dev/null)

if [ -n "$LAST" ]; then
  WALLPAPER=$(find "$WALLPAPER_DIR" -type f \( -iname "*.jpg" -o -iname "*.jpeg" -o -iname "*.png" -o -iname "*.webp" \) | grep -v "$LAST" | shuf -n 1)
else
  WALLPAPER=$(find "$WALLPAPER_DIR" -type f \( -iname "*.jpg" -o -iname "*.jpeg" -o -iname "*.png" -o -iname "*.webp" \) | shuf -n 1)
fi

echo "$WALLPAPER" > "$LAST_WALLPAPER_FILE"

swww img "$WALLPAPER" \
  --transition-type any \
  --transition-fps 60 \
  --transition-duration 1.5 \
  --transition-step 90
