#!/bin/bash
{
	killall files firefox polybar spotify
	spicetify update
	wal-discord

	# generate GTK theme and icon textures using pywal colors
	oomox-cli -d true -o pywal -t /.themes $HOME/aur/oomox/pkg/oomox/opt/oomox/scripted_colors/xresources/xresources
	$HOME/aur/oomox/pkg/oomox/opt/oomox/plugins/icons_gnomecolors/gnome-colors-icon-theme/change_color.sh -o pywal $HOME/aur/oomox/pkg/oomox/opt/oomox/scripted_colors/xresources/xresources

	# update intelliJ theme based on pywal colors
	$HOME/aur/intellijPywal/intellijPywalGen.sh $HOME/.config/JetBrains/DataGrip2020.3
} > /dev/null 2>&1

{
	spotify &
	$HOME/.config/polybar/polybar.sh &
} 2>&1

sleep 1;
rm -rf $PWD/blob_storage
