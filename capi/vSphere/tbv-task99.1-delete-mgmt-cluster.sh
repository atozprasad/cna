#!/bin/bash
unset KUBECONFIG
source mgmt.env

figlet "Delete Cluster ${MGMT_CLUSTER_NAME}"
read
echo "kubectl delete-f ${MGMT_CLUSTER_NAME}.yaml"
kubectl delete-f ${MGMT_CLUSTER_NAME}.yaml
watch  kubectl get clusters
figlet "Cluster ${MGMT_CLUSTER_NAME} got deleted"

