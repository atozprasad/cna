#!/bin/bash
source wlc.env
figlet "Install Antrea CNI in Workload Cluster"

TAG=v0.7.2
wget https://github.com/vmware-tanzu/antrea/releases/download/${TAG}/antrea.yml
mv antrea.yaml ./cluster-services/antrea-${TAGA}.yaml

kubectl apply -f ./cluster-services/antrea-${TAGA}.yaml
watch kubectl get nodes
echo "watch kubectl get all -n kube-system"
watch kubectl get all -n kube-system
echo -e "\n kubectl get  pods --all-namespaces  -o wide"
kubectl get  pods --all-namespaces  -o wide

