#!/bin/bash

DASHBOARD_IP=192.168.20.6

cd istio-1.6.0


# Request routing use case
clear
figlet "Usecase-1 : Request Routing"
read

echo -e "\n Apply a virtual service"
read
cat samples/bookinfo/networking/virtual-service-all-v1.yaml
read
echo -e "\nkubectl apply -f samples/bookinfo/networking/virtual-service-all-v1.yaml"

kubectl apply -f samples/bookinfo/networking/virtual-service-all-v1.yaml
read
echo -e "\n NextStep...";clear

echo -e "\n Lets check the virtual service object"
echo -e "\n kubectl get virtualservices -o yaml"
kubectl get virtualservices -o yaml
read
echo -e "\n NextStep...";clear

echo -e "\n And its subsets"
echo -e "\n kubectl get destinationrules -o yaml"
kubectl get destinationrules -o yaml
read
echo -e "\n NextStep...";clear
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
echo -e "\n NextStep...";clear
read

echo -e "\n Test the new routing configuration"
echo -e "\n Open the Bookinfo site in your browser. The URL is"
echo -e "http://$GATEWAY_URL/productpage"
read


echo -e "\n On the /productpage of the Bookinfo app, log in as user jason. \n
Refresh the browser. What do you see? The star ratings appear next to each review. \n
Log in as another user (pick any name you wish). \n
Refresh the browser. Now the stars are gone. This is because traffic is routed to reviews:v1 for all users except Jason."
read
figlet "Whats happening!"
echo -e "\n\n\n In this task, you used Istio to send 100% of the traffic to the v1 version of each of the Bookinfo services. You then set a rule to selectively send traffic to version v2 of the reviews service based on a custom end-user header added to the request by the productpage service."
read

figlet "Done, Usecase: Istio-setup " 
#echo -e "\n Remove the application virtual services:"
#echo -e "\nkubectl delete -f samples/bookinfo/networking/virtual-service-all-v1.yaml"
#kubectl delete -f samples/bookinfo/networking/virtual-service-all-v1.yaml

