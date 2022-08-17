#!/bin/bash
source vns.env
kubectl vsphere login --server https://${SUPERVISOR_CLUSTER_IP} --insecure-skip-tls-verify  -u ${VS_NS_USER}
figlet "NameSpace ${VS_NAMESPACa} "
kubectl config use-context ${VS_NAMESPACE}
read -p "Done ... "
clear
