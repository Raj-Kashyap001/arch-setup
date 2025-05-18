#!/bin/bash

echo "Warning: This will override the current config files!"
echo "Make sure to create a backup first"
read -p "Proceed? (y/n): " response

case $response in
  [yY]*)
    echo "User chose yes."
    echo "Configuring rofi"
    cp -rvf ../rofi $HOME/.config/

    echo "Configuring fish shell"
    cp -rvf ../fish $HOME/.config/

    echo "Configuring Hyprland"
    cp -rvf ../hypr $HOME/.config/

    echo "Configuring waybar"
    cp -rvf ../waybar $HOME/.config/

    echo "Configuring kitty terminal"
    cp -rvf ../kitty $HOME/.config/

    echo "Configuring dunst terminal"
    cp -rvf ../dunst/ $HOME/.config/

    echo "Configuring fastfetch"
    cp -rvf ../fastfetch/ $HOME/.config/
    
    echo "Configuring wlgout"
    cp -rvf ../wlogout/ $HOME/.config/  
    ;;
  [nN]*)
    echo "Operation Cancelled By User!"
    ;;
  *)
    echo "Invalid input."
    exit 1 
    ;;
esac
