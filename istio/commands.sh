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
kubectl apply -f samples/bookinfo/networking/bookinfo-gateway.yaml
echo -e "\n Next Step..." 
read








