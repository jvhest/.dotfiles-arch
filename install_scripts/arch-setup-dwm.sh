#!/bin/bash

# -----------------------------------------------
# install dependencies for Arch-based distributions
# -----------------------------------------------

sudo pacman -Syu --noconfirm
sudo pacman -S --needed --noconfirm \
    base-devel \
    libx11 \
    libxinerama \
    libxft \
    imlib2 \
    unzip \
    mate-polkit \
    xorg-xinit \
    xorg-server \
    stow \
    xdg-user-dirs

# -----------------------------------------------
# directory tree
# -----------------------------------------------

cd $HOME
mkdir -p .config/
mkdir -p .local/bin
mkdir -p .local/scripts
mkdir -p .local/share
mkdir -p .local/src

xdg-user-dirs-update

# -----------------------------------------------
# clone .dotfiles
# -----------------------------------------------

cd ~
if [ ! -d ~/.dotfiles ]; then
    if ! git clone https://github.com/jvhest/.dotfiles-arch.git ~/.dotfiles; then
        echo "Failed to clone .dotfiles the repository"
        return 1
    fi
else
    echo "Repository already exists, skipping clone"
fi
mv .bash_profile .bash_profile.bak
mv .bashrc .bashrc.bak

# setup config
cd ~/.dotfiles || { echo "Failed to change directory to .dotfiles"; return 1; }
stow -S home

# -----------------------------------------------
# build and install suckless
# -----------------------------------------------

cd $HOME/.local/src/suckless/dwm/
sudo make clean install # Run make clean install

cd $HOME/.local/src/suckless/slstatus/
sudo make clean install # Run make clean install

# -----------------------------------------------
# install fonts
# -----------------------------------------------

install_fonts() {
    FONT_DIR=${HOME}/.local/share/fonts

    # Create directory for fonts if it doesn't exist
    if [ ! -d "$FONT_DIR" ]; then
        mkdir -p "$FONT_DIR" || {
            echo "Failed to create directory: $FONT_DIR"
            return 1
        }
    else
        echo "$FONT_DIR exists, skipping creation."
    fi

    # Array of font names
    fonts=(
        "CascadiaCode"
        "FiraCode"
        "Hack"
        "Inconsolata"
        "JetBrainsMono"
        "Meslo"
        "Mononoki"
        "RobotoMono"
        "SourceCodePro"
        "UbuntuMono"
        # Add additional fonts here if needed
    )

    # Function to check if font directory exists
    check_font_installed() {
        font_name=$1
        if [ -d ${FONT_DIR}/${font_name} ]; then
            echo "Font ${font_name} is already installed. Skipping."
            return 0  # Font already installed
        else
            return 1  # Font not installed
        fi
    }

    # Loop through each font, check if installed, and install if not
    for font in "${fonts[@]}"
    do
        if check_font_installed "${font}"; then
            echo "Skipping installation of font: $font"
            continue  # Skip installation if font is already installed
        fi

        echo "Installing font: ${font}"
        wget -q --show-progress "https://github.com/ryanoasis/nerd-fonts/releases/download/v3.1.1/$font.zip" -P /tmp
        if [ $? -ne 0 ]; then
            echo "Failed to download font: ${font}"
            continue
        fi

        unzip -q /tmp/${font}.zip -d ${FONT_DIR}/${font}/
        if [ $? -ne 0 ]; then
            echo "Failed to extract font: ${font}"
            continue
        fi

        rm /tmp/${font}.zip
    done

    # Update font cache
    fc-cache -fv || {
        echo "Failed to rebuild font cache"
        return 1
    }

    echo "Fonts installation completed."
}

install_extra_packages() {
    sudo pacman -S --needed --noconfirm \
        picom \
        dunst \
        sxhkd \
        redshift \
        xorg-xrandr \
        xdotool \
        xclip \
        feh \
        flameshot \
        lxappearance \
        rofi
}

install_fonts
install_picom
install_extra_packages

echo "All dependencies installed successfully."
