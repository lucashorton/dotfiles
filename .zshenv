#!/bin/zsh

if [ "$XDG_SESSION_TYPE" = "wayland" ];then
    eval $(gnome-keyring-daemon --start)
    export SSH_AUTH_SOCK
fi
