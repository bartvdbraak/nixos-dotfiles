#!/usr/bin/env bash

nixos_home="${1:-$(dirname "$(realpath "$0")")}"

# Check if the symlink exists and is valid
if [ -L /etc/nixos ] && [ -e /etc/nixos ]; then
    echo "The symlink /etc/nixos already exists and is valid. Exiting."
    exit 0
fi

# Backup current /etc/nixos if it exists
if [ -e /etc/nixos ]; then
    mv /etc/nixos /etc/nixos.bak
    echo "Created backup of current /etc/nixos"
fi

# Create symlink
ln -s "$nixos_home" /etc/nixos
echo "Symlinked /etc/nixos to $nixos_home"
