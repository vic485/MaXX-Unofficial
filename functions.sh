#!/bin/bash

# Y/n confirmation
function confirm_prompt {
  while true; do
    read -p "$* [Y/n]: " yn
    case $yn in
      [Yy]*) return 0;;
      [Nn]*) return 1;;
    esac
  done
}

# Write file to add necessary shared data directories
function write_data_dir {
  # https://bbs.archlinux.org/viewtopic.php?id=19223
  cat > /etc/profile.d/data_dirs.sh<< EOF
#!/bin/bash
export XDG_DATA_DIRS="$XDG_DATA_DIRS:/usr/share"
EOF
return 0
}

# Download and install MaXX
install_maxx() {
  cd /tmp
  bash -c "$(curl -fsSL https://s3.ca-central-1.amazonaws.com/cdn.maxxinteractive.com/maxx-desktop-installer/MaXX-Desktop-LINUX-x86_64-2.2.0-Installer.sh)"
}
