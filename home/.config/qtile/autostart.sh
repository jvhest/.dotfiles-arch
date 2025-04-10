#!/usr/bin/env bash

COLORSCHEME=DoomOne

### AUTOSTART PROGRAMS ###
xrandr --output HDMI-1 --mode 1920x1080 --right-of HDMI-2 --output HDMI-2 --primary --mode 1920x1080 &

# setup redshift
redshift -l 51.32:4.94 -t 6500:5000 -g 0.8 -m randr &

# polkit
/usr/lib/policykit-1-gnome/polkit-gnome-authentication-agent-1 &

lxsession &

picom --daemon &

# sxhkd
# (re)load sxhkd for keybinds
if hash sxhkd >/dev/null 2>&1; then
	pkill sxhkd
	sleep 0.5
	sxhkd -c "$HOME/.config/qtile/sxhkd/sxhkdrc" &
fi

# /usr/bin/emacs --daemon &
nm-applet &   # network manager
# "$HOME"/.screenlayout/layout.sh &
sleep 1
# conky -c "$HOME"/.config/conky/qtile/01/"$COLORSCHEME".conf || echo "Couldn't start conky."

# background
### UNCOMMENT ONLY ONE OF THE FOLLOWING THREE OPTIONS! ###
# 1. Uncomment to restore last saved wallpaper
feh --bg-fill ~/.local/share/backgrounds/abstract-0008.jpg &
# xargs xwallpaper --stretch < ~/.cache/wall &
# 2. Uncomment to set a random wallpaper on login
# find /usr/share/backgrounds/dtos-backgrounds/ -type f | shuf -n 1 | xargs xwallpaper --stretch &
# 3. Uncomment to set wallpaper with nitrogen
# nitrogen --restore &


# activate left screen
xdotool mousemove --screen 0 1850 1030
xdotool click 1
# open terminal
xdotool key super+Enter
