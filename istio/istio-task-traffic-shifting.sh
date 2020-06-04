#!/bin/bash
#set -x #echo on

DASHBOARD_IP=192.168.20.6

cd istio-1.6.0


# Request routing use case
figlet "Usecase-2 : Traffic Shifting"
read

echo -e "\n Apply weight-based routing"
read
echo -e "\nAt first route all traffic to the v1 version of each microservice"
read
cat samples/bookinfo/networking/virtual-service-all-v1.yaml
read
echo "kubectl apply -f samples/bookinfo/networking/virtual-service-all-v1.yaml"
kubectl apply -f samples/bookinfo/networking/virtual-service-all-v1.yaml
echo -e "\n NextStep..." 
read

echo -e "\n Transfer 50% of the traffic from reviews:v1 to reviews:v3"
cat  samples/bookinfo/networking/virtual-service-reviews-50-v3.yaml
read
echo -e "\nkubectl apply -f samples/bookinfo/networking/virtual-service-reviews-50-v3.yaml"
kubectl apply -f samples/bookinfo/networking/virtual-service-reviews-50-v3.yaml
read
echo -e "\n NextStep..." 


echo -e "\n Confirm the rule was replaced:"
kubectl get virtualservice reviews -o yaml
read
echo -e "\n NextStep..." 

echo -e "\n Refresh the /productpage in your browser and you now see red colored star ratings approximately 50% of the time. This is because the v3 version of reviews accesses the star ratings service, but the v1 version does not."
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
echo -e "\n Open the Bookinfo site in your browser. The URL is"
echo -e "http://$GATEWAY_URL/productpage"
read
 read
echo -e "\n NextStep..." 

echo -e "\n Lets shift all 100% of the traffic to reviews:v3 by applying this virtual service:"
cat samples/bookinfo/networking/virtual-service-reviews-v3.yaml
read
echo -e "\nkubectl apply -f samples/bookinfo/networking/virtual-service-reviews-v3.yaml"
kubectl apply -f samples/bookinfo/networking/virtual-service-reviews-v3.yaml
read
echo -e "\nNow when you refresh the /productpage you will always see book reviews with red colored star ratings for each review."
read

echo -e "\nWhat happend!"
echo -e "\n In this task you migrated traffic from an old to new version of the reviews service using Istio’s weighted routing feature. Note that this is very different than doing version migration using the deployment features of container orchestration platforms, which use instance scaling to manage the traffic."


echo -e "\n Remove the application virtual services:"
kubectl delete -f samples/bookinfo/networking/virtual-service-all-v1.yaml
read

echo -e "\n On the /productpage of the Bookinfo app, log in as user jason. \n
Refresh the browser. What do you see? The star ratings appear next to each review. \n
Log in as another user (pick any name you wish). \n
Refresh the browser. Now the stars are gone. This is because traffic is routed to reviews:v1 for all users except Jason."

figlet "Whats happening!"
echo -e "\n\n\n In this task, you used Istio to send 100% of the traffic to the v1 version of each of the Bookinfo services. You then set a rule to selectively send traffic to version v2 of the reviews service based on a custom end-user header added to the request by the productpage service."


figlet "Done, Usecase: Istio-setup " 
