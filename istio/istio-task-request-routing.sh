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

# Setup environment variables for IngressIP and Port
echo -e "\n Set the ingress IP and ports: (enviornment variables"
export INGRESS_HOST=$(kubectl -n istio-system get service istio-ingressgateway -o jsonpath='{.status.loadBalancer.ingress[0].ip}')
export INGRESS_PORT=$(kubectl -n istio-system get service istio-ingressgateway -o jsonpath='{.spec.ports[?(@.name=="http2")].port}')
export SECURE_INGRESS_PORT=$(kubectl -n istio-system get service istio-ingressgateway -o jsonpath='{.spec.ports[?(@.name=="https")].port}')
# Set GATEWAY_URL:
echo -e "\n Set GATEWAY_URL:"
export GATEWAY_URL=$INGRESS_HOST:$INGRESS_PORT
echo $GATEWAY_URL
echo -e "\n Next Step..." 
read

echo -e "\n Test the new routing configuration"
echo -e "\n Open the Bookinfo site in your browser. The URL is"
http://$GATEWAY_URL/productpage
read

echo -e "\n Remove the application virtual services:"
kubectl delete -f samples/bookinfo/networking/virtual-service-all-v1.yaml
read


figlet "Done, Usecase: Istio-setup " 

