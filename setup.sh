#!/bin/bash

# update the box
apt update
apt upgrade -y

# Create a mount point for your volume:
mkdir -p /mnt/papermc

# Mount your volume at the newly-created mount point:
mount -o discard,defaults,noatime /dev/disk/by-id/scsi-0DO_Volume_papermc /mnt/papermc

# Change fstab so the volume will be mounted after a reboot
echo '/dev/disk/by-id/scsi-0DO_Volume_papermc /mnt/papermc xfs defaults,nofail,discard 0 0' | sudo tee -a /etc/fstab

# install docker prereqs
apt install \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg-agent \
    software-properties-common -y

# add docker repo to apt
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
apt-key fingerprint 0EBFCD88
sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"
apt update

# install docker 
apt install docker-ce docker-ce-cli containerd.io -y

# install docker-compose
curl -L "https://github.com/docker/compose/releases/download/1.25.5/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose
ln -s /usr/local/bin/docker-compose /usr/bin/docker-compose