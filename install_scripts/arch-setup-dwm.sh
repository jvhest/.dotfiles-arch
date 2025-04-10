#!/bin/bash

# -----------------------------------------------
# INSTALL WINDOWMANAGER DWM
# -----------------------------------------------

install-xorg-files() {
    echo "Installing xorg related files."
    sudo pacman -S --needed --noconfirm \
        libx11 \
        libxinerama \
        libxft \
        imlib2 \
        xorg-xinit \
        xorg-server \
        lightdm-gtk-greeter \
}

install-dotfiles() {
    echo "Installing dotfiles with stow."
    sudo pacman -S --needed --noconfirm stow xdg-user-dirs

    # prepare directory structure
    cd $HOME
    mkdir -p .config/
    mkdir -p .local/bin
    mkdir -p .local/scripts
    mkdir -p .local/share
    mkdir -p .local/src

    xdg-user-dirs-update

    # save bash config files
    cd $HOME
    mv .bash_profile .bash_profile.bak
    mv .bashrc .bashrc.bak

    # create links from .dotfiles dir
    cd ${HOME}/.dotfiles || { echo "Failed to change directory to .dotfiles"; return 1; }
    stow -S home
}

build-suckless() {
    echo "Building suckless/dwm."
    cd ${HOME}/.local/src/suckless/dwm/
    sudo make clean install

    echo "Building suckless/slstatus."
    cd ${HOME}/.local/src/suckless/slstatus/
    sudo make clean install
}

install_yay() {
    echo "Installing package manager yay."
    cd $HOME
    git clone https://aur.archlinux.org/yay-bin.git
    cd yay-bin
    makepkg -si
    cd ..
    rm -rf yay-bin
}

install_fonts() {
    echo "Installing fonts."
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
        "Iosevka"
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
        wget -q --show-progress "https://github.com/ryanoasis/nerd-fonts/releases/latest/download/${font}.tar.xz" -P /tmp
        if [ $? -ne 0 ]; then
            echo "Failed to download font: ${font}"
            continue
        fi

        tar -xf /tmp/${font}.tar.xz -C ${FONT_DIR}/${font}/
        # unzip -q /tmp/${font}.zip -d ${FONT_DIR}/${font}/
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

install_dwm_packages() {
    sudo pacman -S --needed --noconfirm \
        picom \
        dunst \
        libnotify \
        sxhkd \
        redshift \
        xorg-xrandr \
        xdotool \
        feh \
        flameshot \
        rofi \

    sudo yay -S --needed --noconfirm brave-bin
}

install_extra_packages() {
    sudo yay -S --needed --noconfirm brave-bin

    sudo pacman -S --needed --noconfirm \
        bash-completion \
        xclip \
        lxappearance \
        alacritty \
        ranger \
        neovim \
        breeze \
        breeze-gtk \
        cmus \
        keepassxc \
        micro \
        networkmanager \
        qt5ct \
        qt6ct \
        transmission-qt \
        sxiv \






}

# update pacman
sudo pacman -Syyu --noconfirm

install-xorg-files
install-dotfiles
build-suckless
install_yay
install_fonts
install_dwm_packages
install_extra_packages

echo "All dependencies installed successfully."
