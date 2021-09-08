#!/usr/bin/env sh

# Launch sway 
if [ $HOSTNAME = "pele" ]; then
  sway -c $HOME/.config/sway/laptop.conf
else
  sway -c $HOME/.config/sway/desktop.conf
fi

playerctld daemon
