#!/usr/bin/env bash

# install nix package manager
sh <(curl -L https://nixos.org/nix/install) --no-daemon

# source nix.sh
. /home/jvh/.nix-profile/etc/profile.d/nix.sh;

#install git
nix-env git

# clone dotfiles
mkdir -p ~/.local/share
cd ~/.local/share
git clone https://github/jvhest/dotfiles


