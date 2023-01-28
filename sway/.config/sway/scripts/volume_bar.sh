#!/bin/sh

VOLUME=$(pamixer --get-volume)
notify-send.sh -a volume-bar -i audio-speakers -h int:value:$VOLUME --replace-file=/tmp/volumenotification "$VOLUME%" 
