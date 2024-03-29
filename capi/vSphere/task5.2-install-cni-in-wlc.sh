#!/bin/bash
source wlc.env
figlet "Install Calico CNI in Workload Cluster"
echo -e "\n kubectl apply -f ./cluster-services/calico.yaml"

kubectl apply -f "./cluster-services/calico.yaml"
watch kubectl get nodes
echo "watch kubectl get all -n kube-system"
watch kubectl get all -n kube-system
echo -e "\n kubectl get  pods --all-namespaces  -o wide"
kubectl get  pods --all-namespaces  -o wide

