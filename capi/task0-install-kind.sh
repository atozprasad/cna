#!/bin/bash
figlet "Setup- kind"
#Download bits
echo -e "\n Downloading bits from internet"
curl -Lo ./kind https://kind.sigs.k8s.io/dl/v0.9.0/kind-linux-amd64
#change file permissions 
chmod +x ./kind
#Move the binary in to your PATH.
echo -e "\nAdmin password for moving the binary to /usr/local/bin/"
sudo mv ./kind /usr/local/bin/kind
#Test to ensure the version you installed is up-to-date:
echo -e "\n Validate Clusterctl "
kind version
figlet "Done with this step"
echo -e "\n NextStep...";read;clear

