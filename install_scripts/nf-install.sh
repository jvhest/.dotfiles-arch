#!/usr/bin/env bash

# /////////////////////////////////////////////////////////////////
#
# NF-install.sh
#  A shell script that installs the Nerd Fonts from repository
#  https://github.com/ryanoasis/nerd-fonts/releases by release
#  version number
#
#  Usage: ./NF-installer.sh [VERSION] [FONTNAME]
#         Format the version number as v3.4.0
#
#  For information for version and fontname see:
#              https://github.com/ryanoasis/nerd-fonts/releases
#
# /////////////////////////////////////////////////////////////////

NF_VERSION="$1"
NF_NAME="$2"

if [ $# -ne 2 ]; then
    echo "Please include a version number argument formatted as vX.XXX"
    echo "and the name of the Nerdfont"
    exit 1
fi

if [ "$1" = "--help" ]; then
    echo "Usage: ./nf-instal [VERSION] [NERD_FONT_NAME]"
    echo "Format [VERSION] as vX.XXX for the desired release version of the fonts."
    exit 0
fi

FONT_INSTALL_PATH="$HOME/.local/share/fonts/${NF_NAME}"

if [ -d ${FONT_INSTALL_PATH} ]; then
    echo "Font $NF_NAME is already installed. Skipping."
    exit 0
fi

echo "Create font directory: $FONT_INSTALL_PATH"
if ! $(mkdir -p $FONT_INSTALL_PATH); then
    echo "Unable to create install path!"
    exit 1
fi

NF_DL_URL="https://github.com/ryanoasis/nerd-fonts/releases/download/$NF_VERSION/$NF_NAME.tar.xz"

echo "Installing font: $NF_NAME"
wget -q --show-progress $NF_DL_URL -P /tmp
if [ $? -ne 0 ]; then
    echo "Failed to download font: $NF_NAME"
    exit 1
fi

tar xfC /tmp/${NF_NAME}.tar.xz  ${FONT_INSTALL_PATH}
if [ $? -ne 0 ]; then
    echo "Failed to extract font: $NF_NAME"
    exit 1
fi

echo "Cleaning up..."
rm -f /tmp/${NF_NAME}.tar.xz

# clear and regenerate font cache

echo " "
echo "Clearing and regenerating the font cache.  You will see a stream of text as this occurs..."
echo " "
fc-cache -f -v

echo " "
echo "Testing. You should see the expected install filepaths in the output below..."
echo " "
fc-list | grep "$NF_NAME"

echo " "
echo "Install of Nerd Font $NF_NAME complete."
exit 0
