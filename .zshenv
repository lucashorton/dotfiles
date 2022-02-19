#!/bin/zsh

if [ "$XDG_SESSION_TYPE" = "wayland" ];then
    eval $(gnome-keyring-daemon --start --components=gpg,pkcs11,secrets,ssh)
    export SSH_AUTH_SOCK
fi
