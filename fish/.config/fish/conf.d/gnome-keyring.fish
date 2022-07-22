if test -n $DISPLAY; and test $XDG_SESSION_TYPE != "tty"
   set -x (gnome-keyring-daemon --start | string split "=")
end
