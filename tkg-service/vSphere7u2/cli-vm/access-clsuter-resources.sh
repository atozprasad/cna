#!/bin/bash
figlet "List TKC clusters"
kubectl get tanzukubernetescluster
read -p "Next ..."
clear

figlet "List virtualmachinesetresourcepolicy "
kubectl get virtualmachinesetresourcepolicy
read -p "Next ..."

figlet "List virtualmachineservice "
kubectl get virtualmachineservice
read -p "Next ... "

figlet "List virtualmachine" 
kubectl get virtualmachine 
read -p "Next ... "

figlet "List cluster-api resources"
kubectl get cluster-api
read -p "Done"
