#!/usr/bin/env bash

set -e

info()  { echo -e "\033[36m"$1"\033[0m"; }
error() { echo -e "\033[31m"$1"\033[0m"; }

if ! command -v pacman &> /dev/null; then
    error "this is not arch-based distro"
    exit 1
fi

sudo sed -i "/\[multilib\]/,/Include/ s/^#//" /etc/pacman.conf

sudo pacman -Sy --needed - < packets.txt

flatpak install dev.vencord.Vesktop \
                org.vinegarhq.Sober \
                com.lunarclient.LunarClient

# create default directories
mkdir -p $HOME/downloads
mkdir -p $HOME/screenshots
mkdir -p $HOME/vms
mkdir -p $HOME/c

DOTFILES_DIR=$(pwd)

# building dmenu from source
pushd ~/.config

git clone https://git.suckless.org/dmenu
cd dmenu
patch -p1 <<< $(curl https://tools.suckless.org/dmenu/patches/center/dmenu-center-20250407-b1e217b.diff)  
stow --dir "$DOTFILES_DIR" dmenu
sudo make clean install

popd

stow --dir "$DOTFILES_DIR" bash dunst fastfetch i3 \
                           images picom scripts vim X11

info "reboot pc [y/N]"

read -s -n 1 OPTION

case "$OPTION" in
    y|Y|"") reboot ;;
    n|N)    exit 1 ;;
    *)      error "unknown option" ;;
esac
