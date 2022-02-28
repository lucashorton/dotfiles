#!/bin/zsh

export _JAVA_AWT_WM_NONREPARENTING=1
export QT_QPA_PLATFORM=wayland
export XDG_SESSION_TYPE=wayland
export XDG_CURRENT_DESKTOP=sway
export GTK_USE_PORTAL=0
eval $(gnome-keyring-daemon --start --components=gpg,pkcs11,secrets,ssh | sed 's/^\(.*\)/export \1/g')
sway
