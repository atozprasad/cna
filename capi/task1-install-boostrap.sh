#!/bin/bash
figlet "create kind Cluster"
# Create a Kind Cluster
echo -e "\n Create kind Cluster "
kind create cluster
# Check a cluster creation
echo -e "\n Cluster-info"
kubectl cluster-info
kubectl cluster-info > ./kind-cluster.info


figlet "Done with this task"
echo -e "\n NextStep...";read;clear
