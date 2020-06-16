#!/bin/bash
figlet "Install Docker on Ubuntu16"
#Download bits

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
su -s ${USER}
docker run hello-world

figlet "Done with this task"
echo -e "\n NextStep...";read;clear


