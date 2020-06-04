#!/bin/bash
set -x #echo on

DASHBOARD_IP=192.168.20.6

# Request routing use case
figlet "Usecase-1 : Request Routing"


echo -e "\n Apply a virtual service"
cat samples/bookinfo/networking/virtual-service-all-v1.yaml
kubectl apply -f samples/bookinfo/networking/virtual-service-all-v1.yaml
read
echo -e "\n NextStep..." 

echo -e "\n Lets check the virtual service object"
kubectl get virtualservices -o yaml
read
echo -e "\n NextStep..." 

echo -e "\n And its subsets"
kubectl get destinationrules -o yaml
read
echo -e "\n NextStep..." 
read

echo -e "\n Test the new routing configuration"
echo -e "\n Open the Bookinfo site in your browser. The URL is"
http://$GATEWAY_URL/productpage


figlet "Done, Usecase: Istio-setup " 

