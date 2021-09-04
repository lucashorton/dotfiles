#!/usr/bin/env sh

# Launch sway 
if [ $HOSTNAME = "pele" ]; then
  sway -c $HOME/.config/sway/laptop-config
else
  waybar
fi

playerctld daemon
