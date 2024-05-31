#!/bin/bash
set -euo pipefail

CURRENT_DIRECTORY=$(pwd)

# Start installing deps (change to apt in case you're in a debian based distro)
sudo pacman -Sy brightnessctl acpid acpi
sudo systemctl start acpid
sudo systemctl enable acpid

# Ensure the script is executable
sudo chmod +x $CURRENT_DIRECTORY/etc/acpi/brightness.sh

# Link files to /etc/acpi
sudo ln -s "$CURRENT_DIRECTORY/etc/acpi/brightness.sh" /etc/acpi/brightness.sh
sudo ln -s $CURRENT_DIRECTORY/etc/acpi/events/brightnessdown /etc/acpi/events/brightnessdown
sudo ln -s $CURRENT_DIRECTORY/etc/acpi/events/brightnessup /etc/acpi/events/brightnessup

# Restart service
sudo systemctl restart acpid

echo "Done"
