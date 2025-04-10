#!/bin/bash
#Build prerequisites
sudo apt install ninja-build gettext cmake unzip curl

# clone
git clone https://github.com/neovim/neovim
cd neovim
git checkout stable
make CMAKE_BUILD_TYPE=RelWithDebInfo
sudo make install

