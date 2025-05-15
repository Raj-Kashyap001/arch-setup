#!/bin/bash

if [ ! -d "$HOME/.themes" ]; then
	mkdir -p "$HOME/.themes"
fi

if [ ! -d "$HOME/.icons" ]; then
	mkdir -p "$HOME/.icons"
fi

theme_url="https://github.com/vinceliuice/Fluent-gtk-theme.git"
wget -qO- https://git.io/papirus-icon-theme-install | env DESTDIR="$HOME/.icons" sh
git clone $theme_url tmp --depth=1
cd tmp && ./install.sh 
rm -rvf ~/tmp
