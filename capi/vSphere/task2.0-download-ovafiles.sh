#!/bin/bash
figlet "Download OVA file"
#Download bits
source govc-config.sh

rm *.ova
echo -e "\n Listout images available for K8S V1.18 "
gsutil ls gs://capv-images/release/${K8SVERSION}/*

echo -e "\n Listout images available for HAProxy "
gsutil ls gs://capv-images/extra/haproxy/release/${HAPVERSION}/*.{ova,sha256} | sed 's~^gs://~http://storage.googleapis.com/~'
echo -e "\n Downloading K8S Bits for ManagementCluster"
echo "wget ${IMAGERPO}/"release"/${K8SVERSION}/${K8SIMAGE}.ova"
wget ${IMAGERPO}/"release"/${K8SVERSION}/${K8SIMAGE}.ova
echo -e "\n Downloading HAProxy  Bits for ManagementCluster"
echo -e  "\n wget ${IMAGERPO}/"extra/haproxy/release"/${HAPVERSION}/${HAPIMAGE}.ova"
wget ${IMAGERPO}/"extra/haproxy/release"/${HAPVERSION}/${HAPIMAGE}.ova


#echo -e "\n Build OVA "
#cd cluster-api-provider-vsphere/
#
#git clone https://github.com/kubernetes-sigs/cluster-api-provider-vsphere.git
figlet "Done with this Task"
