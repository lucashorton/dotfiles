#!/usr/bin/env sh

# Terminate already running bar instances
killall -q waybar
killall -q playerctld
# Wait until the processes have been shut down
while pgrep -x waybar >/dev/null; do sleep 1; done

# Launch main
if [ $HOSTNAME = "pele" ]; then
  waybar -c $HOME/.config/waybar/laptop.conf -s $HOME/.config/waybar/laptop.css
else
  waybar -c $HOME/.config/waybar/desktop.conf -s $HOME/.config/waybar/desktop.css
fi

playerctld daemon
