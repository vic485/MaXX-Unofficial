#!/bin/bash

if [ $UID != 0 ]; then
  echo "Script must be run as root"
  exit 1
fi

. ./functions.sh

confirm_prompt "Did you install flatpak or a desktop environment (e.g. KDE/GNOME)?" || write_data_dir

echo "Installing dependencies"

# Install main packages needed from official instructions
pacman -Sy libjpeg-turbo ncurses5-compat-libs ttf-dejavu noto-fonts noto-fonts-extra --noconfirm

# Install packages found missing on minimal install
pacman -Sy libxpm gtk2 libxml2-legacy --noconfirm

# Directory may not exist
mkdir -p /usr/share/xsessions

echo "Installing MaXX Desktop."
install_maxx

echo "Done! Logout or Reboot."
