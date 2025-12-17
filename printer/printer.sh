# Install local hostname resolution for avahi
sudo pacman -S --needed --noconfirm nss-mdns

# Configure local hostname resolution
sudo sed -i 's/hosts: mymachines resolve/hosts: mymachines mdns_minimal [NOTFOUND=return] resolve/g' /etc/nsswitch.conf

# Enable/start services
sudo systemctl enable --now avahi-daemon.service
sudo systemctl enable --now cups.service
