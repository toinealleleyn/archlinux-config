#!/bin/sh

# Install extra packages.
sudo pacman -S --needed --noconfirm iio-sensor-proxy qgnomeplatform-qt{5,6}

# Libadwaita theme for gtk3 apps.
if command -v paru
then
  paru -S adw-gtk3
  gsettings set org.gnome.desktop.interface gtk-theme adw-gtk3
fi

# Set keyboard layout.
gsettings set org.gnome.desktop.input-sources sources "[('xkb', 'us+intl')]"

# Allow wayland with Nvidia in GDM.
sudo ln -s /dev/null /etc/udev/rules.d/61-gdm.rules