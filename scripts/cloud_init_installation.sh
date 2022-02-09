#!/bin/sh -x

sudo yum -y update

# install cloud support
sudo yum -y install vim bash-completion spice-vdagent cloud-init qemu-guest-agent cloud-utils-growpart
sudo systemctl enable --now qemu-guest-agent.service
sudo cp -f /tmp/cloud.cfg /etc/cloud/cloud.cfg
sudo echo "NOZEROCONF=yes" >> /etc/sysconfig/network
sudo rm /etc/sysconfig/network-scripts/ifcfg-ens3
sudo rm /root/.bash_history; history -c


# copy custom cloud-init configuration (do not modify default apt source list)
sudo cp -f /tmp/cloud.cfg /etc/cloud/cloud.cfg
