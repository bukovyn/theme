#!/bin/bash
HOME="/home/naz"
AUR="$HOME/aur"
CONFIG="$HOME/.config"
THEMES="$HOME/.themes"
OOMOX="$AUR/oomox/pkg/oomox/opt/oomox"
WALLPAPERS="$HOME/images/wallpaper"

{
	killall files firefox polybar spotify
	spicetify update
	wal-discord

	# generate GTK theme and icon textures using pywal colors
	oomox-cli -d true -o pywal -t $HOME/.themes $OOMOX/scripted_colors/xresources/xresources
	$OOMOX/plugins/icons_gnomecolors/gnome-colors-icon-theme/change_color.sh -o pywal $OOMOX/scripted_colors/xresources/xresources

	# update intelliJ theme based on pywal colors
	$AUR/intellijPywal/intellijPywalGen.sh $CONFIG/JetBrains/DataGrip2020.3
} > /dev/null 2>&1

{
	spotify &
	$CONFIG/polybar/polybar.sh &
} 2>&1

sleep 1;
rm -rf $PWD/blob_storage
