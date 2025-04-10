#!/bin/bash

# set PATH so it includes user's private bin if it exists
[ -d "$HOME/bin" ] && PATH="$HOME/bin:$PATH"

# set path so it includes user's private bin if it exists
[ -d "$HOME/.local/bin" ] && PATH="$HOME/.local/bin:$PATH"

# set path so it includes user's private scripts if it exists
[ -d "$HOME/.local/scripts" ] && PATH="$HOME/.local/scripts:$PATH"

export PATH

# if running bash
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
      . "$HOME/.bashrc"
    fi
fi

export SUDO_ASKPASS='/usr/bin/ssh-askpass'

# update Xresources at startup
xrdb -load ~/.config/Xresources

# setup redshift
#redshift -l 51.85:4.94 -t 6500:4500 -b 1.0:0.8 -m randr &
redshift &

# polkit
/usr/lib/policykit-1-gnome/polkit-gnome-authentication-agent-1 &

# restore current wallpaper
feh --bg-scale "$(cat "${XDG_CACHE_HOME}/wall" )" &

# compositor
picom --animations -b &

# sxhkd
# (re)load sxhkd for keybinds
if hash sxhkd >/dev/null 2>&1; then
	pkill sxhkd
	sleep 0.5
	sxhkd -c "$HOME/.config/sxhkd/sxhkdrc" &
fi

# Notifications
dunst &

# start emacs daemon
#/usr/bin/emacs --daemon &

# lock screen when suspended
#xss-lock -- slock &

slstatus &

# Finally, we start a window manager.  We want quitting the
# window manager to end the session, so this command does not
# have an ampersand on the end:
exec dwm
# And when dwm quits, we reach the end of this script and the session ends.

