#!/usr/bin/env bash

info()  { echo -e "\033[36m"$1"\033[0m"; }
error() { echo -e "\033[31m"$1"\033[0m"; }

sudo sed -i "/\[multilib\]/,/Include/ s/^#//" /etc/pacman.conf

sudo pacman -Sy --needed - < packets.txt

flatpak install dev.vencord.Vesktop org.vinegarhq.Sober com.lunarclient.LunarClient

rm -rf $HOME/.config/dunst
rm -rf $HOME/.config/picom
rm -rf $HOME/.config/dmenu

git clone https://github.com/dunst-project/dunst.git $HOME/.config/dunst
git clone https://github.com/yshui/picom.git $HOME/.config/picom
git clone https://git.suckless.org/dmenu $HOME/.config/dmenu

patch -p1 -d $HOME/.config/dmenu < dmenu/patch.diff

sudo cp dmenu/config.h $HOME/.config/dmenu

cp -r i3status-rust $HOME/.config
cp -r kitty $HOME/.config
cp -r i3 $HOME/.config
cp -r dunst $HOME/.config
cp -r picom $HOME/.config
cp -r scripts $HOME
cp .bashrc $HOME
cp .vimrc $HOME
cp .xinitrc $HOME

pushd $HOME/.config

cd dunst
sudo make install
cd ..

cd picom
meson setup --buildtype=release build
sudo ninja -C build install
cd ..

cd dmenu
sudo make clean install

popd

info "Reboot PC? [Y/n]:"

read -s -n 1 option

case "$option" in
    y|Y|"") reboot ;;
    n|N)    exit 1 ;;
    *)      error "Wrong Option" ;;
esac
