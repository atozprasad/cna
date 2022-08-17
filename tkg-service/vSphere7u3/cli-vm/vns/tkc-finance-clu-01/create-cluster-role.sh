#!/bin/bash
source ./tkc.env
source ../vns.env
kubectl vsphere login --server https://${SUPERVISOR_CLUSTER_IP} --insecure-skip-tls-verify  -u ${VS_NS_USER} --tanzu-kubernetes-cluster-name ${TKC_CLUSTER_NAME}
kubectl config use-context ${TKC_CLUSTER_NAME}
kubectl apply -f create-devops-role.yaml
