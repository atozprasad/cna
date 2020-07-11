#!/bin/bash
source wlc.env
figlet "Get Workload Cluster kubeconfig"
unset KUBECONFIG
kubectl get secret/${WLC_CLUSTER_NAME}-kubeconfig -o json | jq -r .data.value | base64 --decode > ./${WLC_CLUSTER_NAME}.kubeconfig

ls ./${WLC_CLUSTER_NAME}.kubeconfig

echo "export KUBECONFIG=./${WLC_CLUSTER_NAME}.kubeconfig" >> wlc.env
source wlc.env
echo $KUBECONFIG
echo -e "\n Switching KUBECONFIG to ${WLC_CLUSTER_NAME}.kubeconfig"
kubectl get nodes
echo -e "\n NextStep...";read;clear


