#!/bin/bash
source vns.env
kubectl vsphere login --server https://${SUPERVISOR_CLUSTER_IP} --insecure-skip-tls-verify  -u ${VS_NS_USER}
figlet "NameSpace ${VS_NAMESPACa} "
kubectl config use-context ${VS_NAMESPACE}
read -p "Next ... "

figlet "List VM Classes"
kubectl get virtualmachineclassbindings
read -p "Next ... "
clear

figlet "List storage classes"
kubectl describe storageclasses
read -p "Next ... "
clear

figlet "List k8s releases"
kubectl get tanzukubernetesreleases
read -p "Next ... "
clear

figlet "List TKCs "
kubectl get tanzukubernetesclusters
read -p "Next ... "
clear
