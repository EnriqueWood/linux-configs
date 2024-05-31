# Customize brightness keys
and make them work in case they don't

## Identify brightness keys
To detect the ACPI events for brightness keys, follow these steps:
1. Open a terminal
2. Run the command: sudo acpi_listen
3. Press the brightness up and brightness down keys.
4. Note the output for each key press. The output will look something like this:
```
video/brightnessup BRTUP 00000086 00000000
video/brightnessdown BRTDN 00000087 00000000
```
5. Use these event codes to configure the appropriate actions in your event handler files.

If that was your output, your content for /etc/acpi/events/brightnessup should be:
```
event=video/brightnessup
action=/etc/acpi/brightness.sh up
```
And your content for /etc/acpi/events/brightnessdown should be:
```
event=video/brightnessdown
action=/etc/acpi/brightness.sh down
```

## Installation script

Once you have modified `./etc/acpi/events/brightnessdown` and `./etc/acpi/events/brightnessup` according to your keys,
run this script to install files (it will make symbolic links to the files in this repository)

```bash
#!/bin/bash

# Start installing deps
sudo pacman -Sy brightnessctl acpid acpi
sudo systemctl start acpid
sudo systemctl enable acpid

# Ensure the script is executable
sudo chmod +x /etc/acpi/brightness.sh

# Link files to /etc/acpi
sudo ln -s ./etc/acpi/brightness.sh /etc/acpi/brightness.sh
sudo ln -s ./etc/acpi/events/brightnessdown /etc/acpi/events/brightnessdown
sudo ln -s ./etc/acpi/events/brightnessup /etc/acpi/events/brightnessup

# Restart service
sudo systemctl restart acpid

```
