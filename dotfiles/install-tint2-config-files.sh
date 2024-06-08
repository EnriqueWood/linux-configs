#!/bin/env bash
script_location="$0"

full_path=$(dirname "$(realpath "$script_location")")
cp $HOME/.config/tint2/tint2rc $HOME/.config/tint2/tint2rc.backup

echo "A backup of your $HOME/.config/tint2/tint2rc was made in $HOME/.config/tint2/tint2rc.backup"

cp $full_path/tint2/tint2rc $HOME/.config/tint2/tint2rc

echo "New config applied"
