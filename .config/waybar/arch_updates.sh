#!/bin/sh

UPDATES=$(yay -Qu | wc -l)

if [ $UPDATES -gt 0 ]; then
  echo "{\"text\":\"$UPDATES\", \"alt\": \"available\"}"
elif [ $UPDATES -eq 0 ]; then
  echo '{"text":"", "alt":"none"}'
fi
