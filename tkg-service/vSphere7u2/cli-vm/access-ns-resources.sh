#!/bin/bash
figlet "List VM Classes"
kubectl get virtualmachineclassbindings
read -p "Next ... "
clear

figlet "List storage classes"
kubectl describe storageclasses
read -p "Next ... "
clear

figlet "List k8s releases"
kubectl get tanzukubernetesreleases
read -p "Next ... "
clear

figlet "List TKCs "
kubectl get tanzukubernetesclusters
read -p "Next ... "
clear
