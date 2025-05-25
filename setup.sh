#!/bin/bash

echo "My Arch Setup With Hyprland DE"

# Pre-Setup Process [Mirror Selection]
read -p "Would you like to set up mirros for before continuing Y/n?" res

if [[ "$res" == ['Yy'] ]]; then
  read -p "Enter country name for selecting mirror: " country
  sh ./base/aur.sh "$country"
elif [[ "$res" == ['Nn'] ]]; then
  echo  "Skipping Mirror selection..."
else
  echo "Invalid Input"
  exit 1
fi

# Installing Essential Apps
apps="wget git fish tmux kitty fzf zoxide man ripgrep fastfetch kitty mission-center nvim clang unzip cmake nodejs npm python-pip vlc github-cli \
	rofi-wayland qt5ct qt6ct qt6-base thunar alsa-utils font-manager swww hyprland krita grim dunst fastfetch obs-studio hyprpolkitagent wl-color-picker nwg-clipman nwg-look ttf-jetbrains-mono-nerd"

apps_aur="visual-studio-code-bin localsend-bin google-chrome \
          ocs-url normcap \
          waypaper \
          wlogout 
          "

if command -v yay >/dev/null 2>&1; then
  echo "Checking for yay..., Found AUR Helper Yay"
else
  echo "Yay is not installed, Installing Yay:"
  sh ./base/aur.sh

echo "Following commands for setting up application require sudo expect password prompt!"

sudo pacman -Syu $apps --noconfirm --needed
yay -Syu $apps_aur --noconfirm --cleanafter --needed

# Setting up theming GTK only
  sh ./base/theme.sh
  echo "Themes are saved now you can apply with nwg-look"

# Setting up Dotfiles
sh ./base/dotfiles.sh

# Download wallpapers (Optional)
read -p "Download wallpapers from repo? Y/n" responce 

if $responce == "Y"; then
  sh ./base/wallpapers.sh
  echo "Wallpapers are saved in $HOME/Pictures/. You can apply with waypaper"
fi


