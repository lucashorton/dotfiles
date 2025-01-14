source /opt/asdf-vm/asdf.fish
starship init fish | source
set EDITOR nvim

if test -z $DISPLAY; and test (tty) = "/dev/tty1"
    $HOME/.config/sway/sway.sh
end

set -l xdg_data_home $XDG_DATA_HOME ~/.local/share
set -gx --path XDG_DATA_DIRS $xdg_data_home[1]/flatpak/exports/share:/var/lib/flatpak/exports/share:/usr/local/share:/usr/share

for flatpakdir in ~/.local/share/flatpak/exports/bin /var/lib/flatpak/exports/bin
    if test -d $flatpakdir
        contains $flatpakdir $PATH; or set -a PATH $flatpakdir
    end
end
