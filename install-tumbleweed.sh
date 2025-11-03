#!/bin/bash

if [ $UID != 0 ]; then
  echo "Script must be run as root"
  exit 1
fi

./functions.sh

confirm_prompt "Did you install flatpak or a desktop environment (e.g. KDE/GNOME)?" || write_data_dir

echo "Installing dependencies."

# Install main packages needed from official instructions
zypper -n install cpp libXaw7 libncurses{5,6} libjpeg62 libgtk-2_0-0 libglut3 xterm xorg-x11-fonts dejavu-fonts

# Install extra packages needed to support Maxx applications
## libXm4 - required by winterm and adminterm
zypper -n install libXm4

echo "Installing MaXX Desktop."
install_maxx

# Some final additional items
## shutdown is in /usr/sbin which is not in the standard user path causing the MaXX Shutdown and Reboot programs to fail
ln /usr/sbin/shutdown /usr/bin/shutdown

# Sketchy link until future updates fix.
## Rox-Filer requires libxml2.so.2 but only libxml2.so.16 is officially provided now
ln /usr/lib64/libxml2.so.16 /usr/lib64/libxml2.so.2

confirm_prompt "Install pavucontrol? (Will setup pulse/pipewire if not done already)" && zypper -n install pavucontrol

echo "Done! Logout or Reboot."
