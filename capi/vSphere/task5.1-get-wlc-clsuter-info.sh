#!/bin/bash
figlet "Get Workload Cluster kubeconfig"

kubectl get secret/capi-wlc1-kubeconfig -o json \
  | jq -r .data.value \
  | base64 --decode \
  > ./wlc1-cluster.kubeconfig

ls ./wlc1-cluster.kubeconfig

echo -e "\n kubectl --kubeconfig ./wlc1-cluster.kubeconfig get nodes"
 kubectl --kubeconfig ./wlc1-cluster.kubeconfig get nodes

