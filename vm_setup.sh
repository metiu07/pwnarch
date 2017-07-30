#!/bin/bash

# Author: metiu07
# Date  : 17.6.2017

# What this script does:
# 1. Updates everything currently in VM
# 2. Checks if VM is 64bit
# 2a. If true enables multilib
# 3. Dowload "bare minimum" packages
# 4a/b. Enables chosen repository 

SCRIPT_SHA1SUM=34b1a3698a4c971807fb1fe41463b9d25e1a4a09

# This script is supposed to run without user interaction
PACMAN_FLAGS=--noconfirm

# Uncomment locale in /etc/locale.gen
# Run sudo locale-gen

# 1.
sudo pacman $PACMAN_FLAGS -Sy

# 2.
BITS=$(uname -m)

# 2a.
if [ $BITS == "x86_64" ]; then
    echo "Enabling multilib"

    # There can be done some fancy uncommenting things with sed
    sudo echo -e "[multilib]\nInclude = /etc/pacman.d/mirrorlist" >> /etc/pacman.conf

    # Upgrade sytem
    sudo pacman -Sy
fi

# 3.
sudo pacman $PACMAN_FLAGS -S base-devel tmux screen vim emacs-nox git

# 4a.
echo "Installign BlackArch Repo"

# VMs dont matter, right?
curl https://blackarch.org/strap.sh -o /tmp/strap.sh && sudo sh /tmp/strap.sh

# 4b.
# echo "Installing Arch Strike Repo"
# sudo echo -e "[archstrike]\nServer = https://mirror.archstrike.org/$arch/$repo" >> /etc/pacman.conf
