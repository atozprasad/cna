#!/bin/bash
unset KUBECONFIG
source wlc.env

figlet "Delete Cluster ${WLC_CLUSTER_NAMWE}"
read
echo "kubectl delete-f ${WLC_CLUSTER_NAME}.yaml"
kubectl delete-f ${WLC_CLUSTER_NAME}.yaml
watch  kubectl get clusters
figlet "Cluster ${WLC_CLUSTER_NAMWE} got deleted"

