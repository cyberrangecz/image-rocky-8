#!/bin/sh -xe

ISOPATH="$HOME/VBoxGuestAdditions.iso"

if [ ! -e "$ISOPATH" ]; then
    echo "Error: virtualbox guest additions ISO not found at $ISOPATH"
    exit 1
fi

# Mount virtualbox guest additions ISO and install

sudo mkdir -p /tmp/VBoxGuestAdditions
sudo mount -o loop,ro "$ISOPATH" /tmp/VBoxGuestAdditions
sudo dnf install tar bzip2 kernel-devel-$(uname -r) kernel-headers perl gcc make elfutils-libelf-devel -y
sudo /tmp/VBoxGuestAdditions/VBoxLinuxAdditions.run

sudo rm "$ISOPATH"
sudo umount /tmp/VBoxGuestAdditions
sudo rmdir /tmp/VBoxGuestAdditions
