# prevent gtk programs to start very slow for non-root users
# https://unix.stackexchange.com/questions/594541/gtk-apps-slow-if-not-root
dbus-update-activation-environment --systemd DBUS_SESSION_BUS_ADDRESS DISPLAY XAUTHORITY

slstatus &

# update Xresources at startup
xrdb -load ~/.config/Xresources

# setup monitors the way I like them.
virt=$(xrandr | grep ^Virtual | wc -l)	# running in VM
if [ $virt -eq 1 ]; then
	xrandr --output Virtual-1 --mode 1920x1080 &
else
	xrandr --output HDMI-1 --mode 1920x1080 --right-of HDMI-2 --output HDMI-2 --primary --mode 1920x1080 &
fi

# setup redshift
redshift -l 51.32:4.94 -t 6500:5000 -g 0.8 -m randr &

# polkit
/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 &
# /usr/lib/mate-polkit/polkit-mate-authentication-agent-1 &

# restore current wallpaper
#feh --bg-scale "$(cat "${XDG_CACHE_HOME}/wall" )" &
~/.fehbg

# compositor
# picom --animations -b &
picom -b &

# sxhkd
# (re)load sxhkd for keybinds
if hash sxhkd >/dev/null 2>&1; then
	pkill sxhkd
	sleep 0.5
	sxhkd -c "$HOME/.config/dwm/sxhkd/sxhkdrc" &
fi

# Notifications
dunst &

# start emacs daemon
#/usr/bin/emacs --daemon &

# lock screen when suspended
#xss-lock -- slock &

# activate left screen
xdotool mousemove --screen 0 1850 1030
xdotool click 1
# open alacritty
xdotool key super+Enter
