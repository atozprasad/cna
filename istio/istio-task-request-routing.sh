#!/bin/bash
set -x #echo on

DASHBOARD_IP=192.168.20.6

# Request routing use case
figlet "Usecase-1 : Request Routing"


echo -e "\n Apply a virtual service"
cat samples/bookinfo/networking/virtual-service-all-v1.yaml
kubectl apply -f samples/bookinfo/networking/virtual-service-all-v1.yaml
read

echo -e "\n Lets check the virtual service object"
kubectl get virtualservices -o yaml
read

echo -e "\n And its subsets"
kubectl get destinationrules -o yaml
read



figlet "NextStep..." 
read
