#!/bin/bash
mkdir ˜/tkgscli
cd tkgscli
wget https://$SUPERVISOR_CLUSTER_IP/wcp/helper/linux-amd64/vsphere-docker-credential-helper.zip
unzip vsphere-docker-credential-helper.zip
mkdir -p /etc/docker/certs.d/$HARBOR_IP
cp $HARBOR_ROOT_CA_CRT /etc/docker/certs.d/<harbor_ip>/ca.crt
systemctl restart docker
docker-credential-vsphere login <harbor_ip>
