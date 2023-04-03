#!/bin/bash

# remove comment to enable debugging
# set -x

# Set noninteractive to avoid any input from keyboard
export DEBIAN_FRONTEND=noninteractive

# create new ssh key
[[ ! -f /home/vagrant/.ssh/mykey ]] \
&& mkdir -p /home/vagrant/.ssh \
&& ssh-keygen -f /home/vagrant/.ssh/mykey -N '' \
&& chown -R vagrant:vagrant /home/vagrant/.ssh

################
# Install docker
################

# 1. Set up the repository
apt-get update
apt-get -y install \
	ca-certificates \
	curl \
	gnupg
# 2. Add ocker's official GPG
mkdir -m 0755 -p /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg

# 3. Setting up the repository
## Created the sources.list for install
## Ej. deb [arch=amd64 signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu   focal stable
echo \
  "deb [arch="$(dpkg --print-architecture)" signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  "$(. /etc/os-release && echo "$VERSION_CODENAME")" stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

# 4. Install Dokcer Engine, containerd, and Docker compose
apt-get update
apt-get -y install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

# Adding privilege to Docker. On this way it's not necessary to call sudo on each docker call
usermod -G docker vagrant

#######################
