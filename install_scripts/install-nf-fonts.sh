#!/usr/bin/env bash

set -euo pipefail

# /////////////////////////////////////////////////////////////////
#
# install-nerd-fonts.sh
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

NF_VERSION="v3.4.0"

INSTALL_PATH="$HOME/.local/share/fonts"
NF_DL_URL="https://github.com/ryanoasis/nerd-fonts/releases/download/$NF_VERSION"

if [ "$1" = "--help" ]; then
    echo "Usage: ./install-nf-fonts.sh [list of font names]"
    echo " "
    echo "Example: ./install-nf-fonts FiraMono FiraCode"
    echo ""
    echo "Using release $NF_VERSION. (Change this in script if needed)"
    echo " "
    exit 0
fi

echo "Using release ${NF_VERSION} for installing Nerd Fonts!"

font_names=("$@")

# Loop through each font, check if installed, and install if not
for font_name in "${font_names[@]}"
do
    echo " "
    echo "==== Installing Nerd Font ${font_name}"

    FONT_PATH=${INSTALL_PATH}/${font_name}

    if [ -d ${FONT_PATH} ]; then
        echo "Font ${font_name} already installed! Skipping installation..."       echo "Skipping installation of font: $font"
        continue
    fi

    echo "Create font directory..."
    if ! $(mkdir -p ${FONT_PATH}); then
        echo "Unable to create font directory: ${FONT_PATH}!"
        exit 1
    fi

    echo "Downloading font..."
    wget -q --show-progress $NF_DL_URL/${font_name}.tar.xz -P /tmp
    if [ $? -ne 0 ]; then
        echo "Failed to download font: ${font_name}"
        exit 1
    fi

    echo "Extracting archive..."
    tar xfC /tmp/${font_name}.tar.xz  ${FONT_PATH}
    if [ $? -ne 0 ]; then
        echo "Failed to extract: /tmp/${font_name}.tar.xz"
        exit 1
    fi

    echo "Cleaning up..."
    rm -f /tmp/${font_name}.tar.xz
done

# clear and regenerate font cache

echo " "
echo "Clearing and regenerating the font cache..."
echo " "
fc-cache -f -v

echo " "
echo "Testing installed filepaths..."
echo " "
echo "----------------------------------------------"
for font_name in "${font_names[@]}"
do
    echo "installed files for: ${font_name}"
    fc-list | grep "${font_name}"
    echo "----------------------------------------------"
done

echo " "
echo "Nerd Font Install complete!"
exit 0
