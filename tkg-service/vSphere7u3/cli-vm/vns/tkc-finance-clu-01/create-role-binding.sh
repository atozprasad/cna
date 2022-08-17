#!/bin/bash
clear
source ../vns/vns.env
source ./tkc.env

echo "kubectl vsphere login --server=${SUPERVISOR_CLUSTER_IP} --tanzu-kubernetes-cluster-name ${TKC_CLUSTER_NAME} --tanzu-kubernetes-cluster-namespace ${VS_NAMESPACE} --vsphere-username ${VS_NS_USER} --insecure-skip-tls-verify "

read -p "Press enter to continue ... "

kubectl vsphere login --server=${SUPERVISOR_CLUSTER_IP} --tanzu-kubernetes-cluster-name ${TKC_CLUSTER_NAME} --tanzu-kubernetes-cluster-namespace ${VS_NAMESPACE} --vsphere-username ${VS_NS_USER} --insecure-skip-tls-verify

kubectl config use-context ${TKC_CLUSTER_NAME}

kubectl create clusterrolebinding default-tkg-admin-privileged-binding --clusterrole=psp:vmware-system-privileged --group=system:authenticated
