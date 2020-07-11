#!/bin/bash
figlet "Setup- Clusterctl"
#Download bits
echo -e "\n Downloading bits from internet"

curl -L https://github.com/kubernetes-sigs/cluster-api/releases/download/v0.3.6/clusterctl-linux-amd64 -o clusterctl
#change file permissions 
chmod +x ./clusterctl
#Move the binary in to your PATH.
echo -e "\nAdmin password for moving the binary to /usr/local/bin/clusterctl"
sudo mv ./clusterctl /usr/local/bin/clusterctl
#Test to ensure the version you installed is up-to-date:
echo -e "\n Validate Clusterctl "
clusterctl version
figlet "Done with this step"
echo -e "\n NextStep...";read;clear

