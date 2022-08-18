#!/bin/bash
source sc.env
figlet "Connect to ${SUPERVISOR_CLUSTER_IP} "

kubectl vsphere login --server https://${SUPERVISOR_CLUSTER_IP} --insecure-skip-tls-verify  -u ${SUPERVISOR_CLUSTER_USER} 
kubectl config use-context ${SUPERVISOR_CLUSTER_IP}
read -p "Next ..."
clear


figlet "List contexts"
kubectl config get-contexts
read -p "Next ..."
clear


figlet "List resources"
kubectl api-resources
read -p "Next ..."
clear


figlet "List resources"
kubectl get storageclass
read -p "Next ..."
clear

figlet "List nodes"
kubectl get nodes 

read -p "Done"
clear

