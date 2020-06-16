#!/bin/bash
figlet "Install Calico CNI in Workload Cluster"
echo -e "\n kubectl apply -f https://docs.projectcalico.org/manifests/calico.yaml"

kubectl --kubeconfig ./wlc1-cluster.kubeconfig apply -f https://docs.projectcalico.org/manifests/calico.yaml
watch kubectl --kubeconfig ./wlc1-cluster.kubeconfig  get nodes
