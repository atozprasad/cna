#!/bin/bash
set -x #echo on
source setup.env

figlet "Installation & Setup"
figlet "ISTIO ${VERSION}"
# Download Istio and setpath
echo -e "\n Download Istio and setpath"
curl -L https://istio.io/downloadIstio | ISTIO_VERSION=${VERSION} TARGET_ARCH=${ARCH} sh -
#curl -L https://istio.io/downloadIstio | sh -
cd istio-${VERSION}
export PATH=$PWD/bin:$PATH
echo -e "\n Next Step..." ;read;clear

# install Istio
echo -e "\n install Istio"
istioctl install --set profile=demo
kubectl label namespace default istio-injection=enabled
echo -e "\n Next Step..." ;read;clear
read

# Deploy sample application
echo -e "\n Deploy sample application"
kubectl apply -f samples/bookinfo/platform/kube/bookinfo.yaml
watch kubectl get services,pods
echo -e "\n Next Step..." ;read;clear
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
echo -e "\n Next Step..." ;read;clear
read

# Ensure that there are no issues with the configuration:
echo -e "\n Ensure that there are no issues with the configuration "
istioctl analyze
echo -e "\n Next Step..." ;read;clear
read

# Determining the ingress IP and ports
echo -e "\n Determining the ingress IP and ports "
echo -e "\n kubectl get svc istio-ingressgateway -n istio-system"
kubectl get svc istio-ingressgateway -n istio-system
echo -e "\n Next Step...";read;clear


# Lets Verify all resources for the sample app
echo -e "\n Lets Verify all resources for the sample app"
echo -e "\n kubectl get virtualservices,destinationrules,gateway,pods"
kubectl get virtualservices,destinationrules,gateway,pods
echo -e "\n Next Step...";read;clear

# Setup environment variables for IngressIP and Port
echo -e "\n Set the ingress IP and ports: (enviornment variables"
export INGRESS_HOST=$(kubectl -n istio-system get service istio-ingressgateway -o jsonpath='{.status.loadBalancer.ingress[0].ip}')
export INGRESS_PORT=$(kubectl -n istio-system get service istio-ingressgateway -o jsonpath='{.spec.ports[?(@.name=="http2")].port}')
export SECURE_INGRESS_PORT=$(kubectl -n istio-system get service istio-ingressgateway -o jsonpath='{.spec.ports[?(@.name=="https")].port}')
# Set GATEWAY_URL:
echo -e "\n Set GATEWAY_URL:"
export GATEWAY_URL=$INGRESS_HOST:$INGRESS_PORT
echo $GATEWAY_URL
echo -e "\n Next Step...";read;clear


# Verify external access
echo -e "\n Verify external access"
echo http://$GATEWAY_URL/productpage
echo -e "\n Next Step...";read;clear


# View the dashboard
echo -e "\n View the dashboard"
echo -e "\n istioctl dashboard kiali --address $DASHBOARD_IP -p 30001"
istioctl dashboard kiali --address $DASHBOARD_IP -p 30001
echo -e "\n Next Step...";read;clear

figlet "Done,Istio-setup " 










