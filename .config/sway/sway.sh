#!/usr/bin/env sh

# Launch sway 
if [ $HOSTNAME = "pele" ]; then
  sway -c $HOME/.config/sway/laptop-config
else
  sway -c $HOME/.config/sway/desktop-config
fi

playerctld daemon
