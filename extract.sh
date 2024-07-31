#!/bin/bash
# (c) J~net 2024
#
# Check if /usr/bin/unzip exists
if [ ! -x /usr/bin/unzip ]; then
    echo "unzip is not installed. Installing..."
    
    # Install unzip based on the package manager available
    if command -v apt-get >/dev/null 2>&1; then
        # Debian-based systems (e.g., Ubuntu)
        sudo apt-get update
        sudo apt install -y unzip
    elif command -v yum >/dev/null 2>&1; then
        # Red Hat-based systems (e.g., Fedora)
        sudo yum install -y unzip
    elif command -v dnf >/dev/null 2>&1; then
        # Fedora with dnf
        sudo dnf install -y unzip
    elif command -v pacman >/dev/null 2>&1; then
        # Arch-based systems
        sudo pacman -S --noconfirm unzip
    elif command -v brew >/dev/null 2>&1; then
        # macOS with Homebrew
        brew install unzip
    else
        echo "No supported package manager found. Please install unzip manually."
        exit 1
    fi
else
    echo ""
fi

echo "Unzipping"

unzip bfv2.zip

sudo install.sh

