#!/usr/bin/env bash

echo "Install dmenu? [y/n]"
read -r input

input="${input,,}" 

case $input in
	y) : ;;
	n) echo "interruption" && exit 0 ;;
	*) echo "wrong input!" && exit 1 ;;
esac

pushd ~/.config

git clone https://git.suckless.org/dmenu && cd dmenu

curl https://tools.suckless.org/dmenu/patches/center/dmenu-center-20250407-b1e217b.diff > patch.diff

patch -p1 < patch.diff

sudo make clean install

rm -f patch.diff

popd
