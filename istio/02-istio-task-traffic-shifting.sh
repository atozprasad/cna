#!/bin/bash
#set -x #echo on

DASHBOARD_IP=192.168.20.6

cd istio-1.6.0

echo -e "\n "Apply destination rules"
read
echo -e "\n "kubectl apply -f samples/bookinfo/networking/destination-rule-all.yaml"
echo -e "\n "kubectl get destinationrules -o yaml"
kubectl apply -f samples/bookinfo/networking/destination-rule-all.yaml
#kubectl apply -f samples/bookinfo/networking/destination-rule-all-mtls.yaml
kubectl get destinationrules -o yaml
read

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
echo -e "\n NextStep..." ;read;clear

echo -e "\n Transfer 50% of the traffic from reviews:v1 to reviews:v3"
cat  samples/bookinfo/networking/virtual-service-reviews-50-v3.yaml
read
echo -e "\nkubectl apply -f samples/bookinfo/networking/virtual-service-reviews-50-v3.yaml"
kubectl apply -f samples/bookinfo/networking/virtual-service-reviews-50-v3.yaml
read
echo -e "\n NextStep..." ;read;clear

echo -e "\n Confirm the rule was replaced:"
kubectl get virtualservice reviews -o yaml
read
echo -e "\n NextStep..." ;read;clear

echo -e "\n Refresh the /productpage in your browser and you now see red colored star ratings approximately 50% of the time. This is because the v3 version of reviews accesses the star ratings service, but the v1 version does not."
# Setup environment variables for IngressIP and Port

export INGRESS_HOST=$(kubectl -n istio-system get service istio-ingressgateway -o jsonpath='{.status.loadBalancer.ingress[0].ip}')
export INGRESS_PORT=$(kubectl -n istio-system get service istio-ingressgateway -o jsonpath='{.spec.ports[?(@.name=="http2")].port}')
export SECURE_INGRESS_PORT=$(kubectl -n istio-system get service istio-ingressgateway -o jsonpath='{.spec.ports[?(@.name=="https")].port}')
# Set GATEWAY_URL:
export GATEWAY_URL=$INGRESS_HOST:$INGRESS_PORT
echo -e "\n Open the Bookinfo site in your browser. The URL is"
echo -e "http://$GATEWAY_URL/productpage"
read
echo -e "\n NextStep..." ;read;clear

echo -e "\n Lets shift all 100% of the traffic to reviews:v3 by applying this virtual service:"
echo -e "\n cat samples/bookinfo/networking/virtual-service-reviews-v3.yaml"
cat samples/bookinfo/networking/virtual-service-reviews-v3.yaml
read
echo -e "\nkubectl apply -f samples/bookinfo/networking/virtual-service-reviews-v3.yaml"
kubectl apply -f samples/bookinfo/networking/virtual-service-reviews-v3.yaml
read
echo -e "\nNow when you refresh the /productpage you will always see book reviews with red colored star ratings for each review."
read

echo -e "\nWhat happend!"
echo -e "\n In this task you migrated traffic from an old to new version of the reviews service using Istio’s weighted routing feature. Note that this is very different than doing version migration using the deployment features of container orchestration platforms, which use instance scaling to manage the traffic."
echo -e "\n With Istio, you can allow the two versions of the reviews service to scale up and down independently, without affecting the traffic distribution between them."


figlet "Done, Usecase02: istio-task-traffic-shifting " 
#echo -e "\n Remove the application virtual services:"
#echo -e "\nkubectl delete -f samples/bookinfo/networking/virtual-service-all-v1.yaml"
#kubectl delete -f samples/bookinfo/networking/virtual-service-all-v1.yaml
