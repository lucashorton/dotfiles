#!/bin/sh

swayidle -w \
timeout 900 'swaylock -f -c 000000' \
timeout 910 'swaymsg "output * dpms off"' resume 'swaymsg "output * dpms on"' \
before-sleep 'swaylock -f -c 000000'
