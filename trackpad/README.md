# Trackpad fixes

## enable-natural-scrolling:

This script helps get natural scrolling enabled using your trackpad.
In case it says file does not exist, check the files in your 
`/etc/X11/xorg.conf.d` directory and look for a file with "trackpad"
in its name, maybe it has another number prefix. In that case, edit the
script and change the "file" variable to match your configuration.
