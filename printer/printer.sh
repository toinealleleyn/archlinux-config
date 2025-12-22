# Install local hostname resolution for avahi
sudo pacman -S --needed --noconfirm cups nss-mdns

# Configure local hostname resolution
sudo sed -i 's/hosts: mymachines resolve/hosts: mymachines mdns_minimal [NOTFOUND=return] resolve/g' /etc/nsswitch.conf

# Disable browsing in cups to supress 'printer added' notifications
sudo sed -i 's/^Browsing Yes/Browsing No/g' /etc/cups/cupsd.conf

# Disable MulticastDNS in systemd-resolved
sudo sed -i 's/^#MulticastDNS=yes/MulticastDNS=no/g' /etc/systemd/resolved.conf

# Enable/start services
sudo systemctl enable --now avahi-daemon.service
sudo systemctl enable --now cups.service
