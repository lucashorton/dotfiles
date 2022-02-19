#!/bin/sh

CURRENT_VALUE=$(cat /sys/class/leds/tpacpi::kbd_backlight/brightness)

if [ $CURRENT_VALUE -eq 2 ]; then
  NEW_VALUE=0
else
  NEW_VALUE=$(expr 1 + $CURRENT_VALUE)
fi

echo $NEW_VALUE
echo $NEW_VALUE > /sys/class/leds/tpacpi::kbd_backlight/brightness
echo $NEW_VALUE > $HOME/.config/sway/state/keyboard
