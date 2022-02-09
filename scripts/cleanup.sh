#!/bin/bash -x

# disable ssh root login using password
sudo sed -i 's/#\?PermitRootLogin.*/PermitRootLogin without-password/g' /etc/ssh/sshd_config

# install resolvconf
wget https://roy.marples.name/downloads/openresolv/openresolv-3.10.0.tar.xz
tar fxv openresolv-3.10.0.tar.xz
cd openresolv-3.10.0
sudo make
sudo su -c "sudo make install"
sudo mv /root/openresolv-3.10.0 /usr/local/src

#disable root passwd
sudo passwd -l root

# cleanup
sudo rm -r /root/*
sudo yum -y autoremove
sudo rm -rf /var/log
history -c
