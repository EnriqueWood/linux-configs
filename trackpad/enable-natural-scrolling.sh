#!/bin/bash
# This script helps enabling natural scrolling

if [ "$(id -u)" -ne 0 ]; then
    echo "This script needs to be run as Root user"
    exit 1
fi

file="/etc/X11/xorg.conf.d/50-touchpad.conf"
if [ ! -f "$file" ]; then
    echo "Error: file $file does not exist."
    exit 1
fi

text_to_append='       Option "NaturalScrolling" "true"'
if grep -q 'Option "NaturalScrolling" "true"' "$file"; then
	echo "Done!"
    exit 0
fi

sed -i '/EndSection/{s/.*/'"$text_to_append"'\n&/}' "$file"
echo "Done!, restart your computer to apply"
