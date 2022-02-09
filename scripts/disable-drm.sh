#!/bin/bash -x

# Disabling drm module for fixing spice console graphical problem
sudo touch /etc/modprobe.d/local-blacklist.conf
sudo chmod 0555 /etc/modprobe.d/local-blacklist.conf
sudo printf "blacklist drm\ninstall drm /bin/false\n" >> /etc/modprobe.d/local-blacklist.conf | sudo tee -a /etc/modprobe.d/local-blacklist.conf > /dev/null
dracut -f
