#!/bin/bash
set -x #echo on

DASHBOARD_IP=192.168.20.6

figlet "Installation & Setup"
# Download Istio and setpath
echo -e "\n Download Istio and setpath"
curl -L https://istio.io/downloadIstio | sh -
cd istio-1.6.0
export PATH=$PWD/bin:$PATH
echo -e "\n Next Step..." 
read

# install Istio
echo -e "\n install Istio"
istioctl install --set profile=demo
kubectl label namespace default istio-injection=enabled
echo -e "\n Next Step..." 
read

# Deploy sample application
echo -e "\n Deploy sample application"
kubectl apply -f samples/bookinfo/platform/kube/bookinfo.yaml
watch kubectl get services,pods
echo -e "\n Next Step..." 
read

# Verfiy the things so far...
echo -e "\n Verfiy the things so far..."
kubectl exec -it $(kubectl get pod -l app=ratings -o jsonpath='{.items[0].metadata.name}') -c ratings -- curl productpage:9080/productpage | grep -o "<title>.*</title>"
echo -e "\n Next Step..." 
read

# Lets add Ingressgateway, to Open the application to outside traffic
# Associate this application with the Istio gateway:
echo -e "\n Associate this application with the Istio gateway "
cat samples/bookinfo/networking/bookinfo-gateway.yaml
kubectl apply -f samples/bookinfo/networking/bookinfo-gateway.yaml
echo -e "\n Next Step..." 
read

# Ensure that there are no issues with the configuration:
echo -e "\n Ensure that there are no issues with the configuration "
istioctl analyze
echo -e "\n Next Step..." 
read

# Determining the ingress IP and ports
echo -e "\n Determining the ingress IP and ports "
kubectl get svc istio-ingressgateway -n istio-system
echo -e "\n Next Step..." 
read


# Lets Verify all resources for the sample app
echo -e "\n Lets Verify all resources for the sample app"
kubectl get virtualservices,destinationrules,gateway,pods
echo -e "\n Next Step..." 
read

# Setup environment variables for IngressIP and Port
echo -e "\n Set the ingress IP and ports: (enviornment variables"
export INGRESS_HOST=$(kubectl -n istio-system get service istio-ingressgateway -o jsonpath='{.status.loadBalancer.ingress[0].ip}')
export INGRESS_PORT=$(kubectl -n istio-system get service istio-ingressgateway -o jsonpath='{.spec.ports[?(@.name=="http2")].port}')
export SECURE_INGRESS_PORT=$(kubectl -n istio-system get service istio-ingressgateway -o jsonpath='{.spec.ports[?(@.name=="https")].port}')
echo -e "\n Next Step..." 
read

# Set GATEWAY_URL:
echo -e "\n Set GATEWAY_URL:"
export GATEWAY_URL=$INGRESS_HOST:$INGRESS_PORT
echo -e "\n Next Step..." 
read


# Ensure an IP address and port were successfully assigned to the environment variable:
echo -e "\n Ensure an IP address and port were successfully assigned to the environment variable:"
echo $GATEWAY_URL
echo -e "\n Next Step..." 
read

# Verify external access
echo -e "\n Verify external access"
echo http://$GATEWAY_URL/productpage
echo -e "\n Next Step..." 
read

# View the dashboard
echo -e "\n View the dashboard"
istioctl dashboard kiali --address $DASHBOARD_IP -p 30001
echo -e "\n Next Step..." 
read

figlet "Done, Usecase: Istio-setup " 










