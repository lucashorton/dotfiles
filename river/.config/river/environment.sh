#!/bin/sh

systemctl --user import-environment DISPLAY WAYLAND_DISPLAY
hash dbus-update-activation-environment 2>/dev/null && \
     dbus-update-activation-environment --systemd DISPLAY WAYLAND_DISPLAY
