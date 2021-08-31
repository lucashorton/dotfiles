#!/bin/sh

yay
flatpak update
flatpak uninstall --unused
pkill -RTMIN+8 waybar 

