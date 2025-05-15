#!/bin/bash

sudo pacman -Syu reflector --needed --noconfirm

country=${$1:-India}

echo "Setting up mirros for my country $country"

sudo reflector --verbose --sort rate -l 20 -c $country --save /etc/pacman.d/mirrorlist
