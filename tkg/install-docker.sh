#!/bin/bash
echo -e "\n ##### Installing docker latest version ##### "
apt-get update
apt-get install apt-transport-https ca-certificates curl software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add -
add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
apt-get update
apt-get install docker-ce

adduser $USER
usermod -aG docker $USER
systemctl restart docker
sudo chmod 666 /var/run/docker.sock
su -s ${USER}
docker run hello-world



