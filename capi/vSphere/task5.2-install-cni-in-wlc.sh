#!/bin/bash
source wlc.env
figlet "Install Calico CNI in Workload Cluster"
echo -e "\n kubectl apply -f https://docs.projectcalico.org/manifests/calico.yaml"

kubectl apply -f https://docs.projectcalico.org/manifests/calico.yaml
watch kubectl get nodes
