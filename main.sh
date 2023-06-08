#!/bin/bash

user_name="$USER"

# Cleaning previous directories
echo "Cleaning directories..."
rm WhiteSur* -rf &&

## Cloning required files
# GTK theme
git clone https://github.com/jothi-prasath/WhiteSur-gtk-theme.git --depth=1
# Icons
git clone https://github.com/vinceliuice/WhiteSur-icon-theme.git --depth=1
# Cursors
git clone https://github.com/vinceliuice/WhiteSur-cursors.git --depth=1

## Installing theme ##
# GTK theme
WhiteSur-gtk-theme/install.sh -l -c Dark -c Light
WhiteSur-gtk-theme/tweaks.sh -F

# Icons
WhiteSur-icon-theme/install.sh -b

# Cursors
mkdir -p ~/.local/share/icons/WhiteSur-cursors
cp WhiteSur-cursors/dist/* ~/.local/share/icons/WhiteSur-cursors -prf

# Wallpapers
mkdir -p ~/Pictures/
cp -r wallpaper/* ~/Pictures/ 
gsettings set org.gnome.desktop.background picture-uri "file:///home/$user_name/Pictures/monterey.png"
gsettings set org.gnome.desktop.background picture-uri-dark "file:///home/$user_name/Pictures/monterey.png"

# Load settings using dconf
dconf load / < dconf/settings.dconf

# Fonts
cp fonts/* ~/.local/share/fonts/ 