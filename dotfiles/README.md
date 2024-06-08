# Dotfiles

This are configuration files that will be replaced by the originals to apply my personal settings working on my 2880x1800 14" display laptop, so maybe you should not apply any of these settings.

I'm not providing any uninstallation scripts, but each script makes a backup of the modified file in the same path and with the same name, and adding the extension `.backup` in case you want to recover your original files

## jgmenu

Here I'm modifing the bash script that generates the configuration file `jgmenurc` with some specific Mabox configurations to add some padding to the search box in case it is active and also making wider the text space so it is not trimmed.

Original bash script can be found at:
https://git.maboxlinux.org/Mabox/mb-jgtools/src/branch/master/bin/mb-jgtools

Installation script is

```bash
install-jgmenu-config-files.sh
```

## tint2

Here I'm changing the ~/.config/tint2/tint2rc file to apply the settings I like

Installation script is 

```bash
./install-tint2-config-files.sh
```
