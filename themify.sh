#! /bin/bash
WALLPAPER_PATH="$HOME/images/wallpaper/$1"

if [ $# -eq 1 ]; then
	wal -i "$WALLPAPER_PATH"
elif [ $# -eq 2 ]; then
	wal -i "$WALLPAPER_PATH" --saturate $2
else
	echo "usage $(basename $0) wallpaper.jpg [0.1-0.9]"

./update_theme.sh
