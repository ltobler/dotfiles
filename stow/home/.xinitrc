#!/bin/sh

try_merge() { [ -f "$1" ] && xrdb -merge "$1"; }
try_merge "$HOME/.config/xresources/Xresources"
try_merge "$HOME/xresources/Xresources"
try_merge "$HOME/.Xresources"

try_source() { [ -f "$1" ] && source "$1"; }
try_source "$HOME/.screenlayout/default.sh"

# urxvtd -q -f -o &
redshift &
unclutter &
setxkbmap ch -option caps:swapescape
xset r rate 180 50
nm-applet &
protonmail-bridge --noninteractive &
$HOME/bin/downloads_watcher.sh &
# lxqt-policykit-agent &
dbus-update-activation-environment --systemd DISPLAY
eval $(/usr/bin/gnome-keyring-daemon --start --components=pkcs11,secrets,ssh)
export SSH_AUTH_SOCK
# eval $(ssh-agent)

exec herbstluftwm
