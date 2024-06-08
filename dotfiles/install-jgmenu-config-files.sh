#!/bin/env bash
# The only file to change here is a bash script to grow search bar padding

script_location="$0"

full_path=$(dirname "$(realpath "$script_location")")

sudo cp /usr/bin/mb-jgtools /usr/bin/mb-jgtools.backup

echo "A backup of your /usr/bin/mb-jgtools was made in /usr/bin/mb-jgtools.backup"

sudo cp $full_path/jgmenu/mb-jgtools /usr/bin/mb-jgtools

echo "New config applied"
