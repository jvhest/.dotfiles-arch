#
# ~/.bash_profile

echo "~/.bash_profile" >> ~/test.log

# set PATH so it includes user's private bin if it exists
[ -d "$HOME/bin" ] && PATH="$HOME/bin:$PATH"

# set path so it includes user's private bin if it exists
[ -d "$HOME/.local/bin" ] && PATH="$HOME/.local/bin:$PATH"

# set path so it includes user's private scripts if it exists
[ -d "$HOME/.local/scripts" ] && PATH="$HOME/.local/scripts:$PATH"

# set path so it includes user's private scripts if it exists
[ -d "$HOME/.local/dmscripts" ] && PATH="$HOME/.local/dmscripts:$PATH"

export PATH

# if running bash
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
      . "$HOME/.bashrc"
    fi
fi

# . "$HOME/.cargo/env"

export QT_QPA_PLATFORMTHEME="qt5ct"

# start dwm
if [ "$(tty)" = "/dev/tty1" ] && ! pidof -s Xorg >/dev/null 2>&1 && [ -f "$HOME/.xinitrc" ] && grep -q "^exec dwm" "$HOME/.xinitrc"; then
  # export XDG_SESSION_TYPE="x11"
  # startx "$XDG_CONFIG_HOME/X11/xinitrc"
  startx
  logout
# fi


. "$HOME/.local/share/../bin/env"

