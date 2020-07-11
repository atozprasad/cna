#!/bin/bash
source mgmt.env
figlet "Get Workload Cluster kubeconfig"
unset KUBECONFIG
kubectl get secret/${MGMT_CLUSTER_NAME}-kubeconfig -o json | jq -r .data.value | base64 --decode > ./${MGMT_CLUSTER_NAME}.kubeconfig

ls ./${MGMT_CLUSTER_NAME}.kubeconfig

echo "export KUBECONFIG=./${MGMT_CLUSTER_NAME}.kubeconfig" >> mgmt.env
source mgmt.env
echo $KUBECONFIG
echo -e "\n Switching KUBECONFIG to ${MGMT_CLUSTER_NAME}.kubeconfig"
kubectl get nodes
echo -e "\n NextStep...";read;clear


