#!/bin/sh

INDICATOR="mute-indicator"
TEXT="Mute"
VOLUME=0

if [ $(pamixer --get-mute) != "true" ]; then
  INDICATOR="volume-bar"
  VOLUME=$(pamixer --get-volume)
  TEXT="$VOLUME%"
fi

notify-send.sh -a $INDICATOR -i audio-speakers -h int:value:$VOLUME --replace-file=/tmp/volumenotification $TEXT
