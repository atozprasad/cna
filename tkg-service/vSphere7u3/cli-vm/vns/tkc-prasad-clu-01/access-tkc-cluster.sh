#!/bin/bash

source tkc.env 

kubectl vsphere login --server=${SUPERVISOR_CLUSTER_IP} --tanzu-kubernetes-cluster-name ${TKC_CLUSTER_NAME} --tanzu-kubernetes-cluster-namespace ${VS_NAMESPACE} --vsphere-username ${TKC_CLUSTER_USER} --insecure-skip-tls-verify 
kubectl config use-context ${TKC_CLUSTER_NAME}
figlet "get nodes"
kubectl get nodes
figlet "Cluster Role Binding"
kubectl get clusterrolebinding | grep vmware-system

