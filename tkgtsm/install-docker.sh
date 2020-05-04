#!/bin/bash
echo -e "\n ##### Installing docker latest version ##### "
apt-get update
apt-get install apt-transport-https ca-certificates curl software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add -
add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
sudo apt-get update
apt-cache policy docker-ce
sudo apt-get install -y docker-ce
sudo systemctl status docker
#systemctl restart docker

adduser $USER
sudo usermod -aG docker $USER
su -s ${USER}
docker run hello-world



