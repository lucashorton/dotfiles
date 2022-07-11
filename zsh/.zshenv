if [ -n "$WAYLAND_DISPLAY" ];then
    eval $(gnome-keyring-daemon --start)
    export SSH_AUTH_SOCK
fi

