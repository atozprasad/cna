#!/bin/bash
figlet "create kind Cluster"
# Create a Kind Cluster
echo -e "\n Create kind Cluster "
#kind create cluster
kind create cluster --config kind-calico.yaml

# Check a cluster creation
echo -e "\n Cluster-info"
export KUBECONFIG="$(kind get kubeconfig-path --name="kind")"
watch kubectl get pods -n kube-system

# Install Calico on KIND cluster
kubectl apply -f calico.yaml

#Relax Calico's RPF Check Configuration
#By default, Calico pods fail if the Kernel's Reverse Path Filtering (RPF) check is not enforced. This is a security measure to prevent endpoints from spoofing their IP address.
#The RPF check is not enforced in Kind nodes. Thus, we need to disable the Calico check by setting an environment variable in the calico-node DaemonSet:
kubectl -n kube-system set env daemonset/calico-node FELIX_IGNORELOOSERPF=true

#verify calico is up and running
watch kubectl -n kube-system get pods | grep calico-node




figlet "Done with this task"
