# ISTIO runbook

command line runbook for quick reference

## Installation

### Download ISTIO bits
```bash
curl -L https://istio.io/downloadIstio | sh -

```

Go to the folder

```bash
cd istio-1.6.0

```

Set path to the bin folder where ISTIOCTL located

```bash
export PATH=$PWD/bin:$PATH
```
### Install ISTIO bits
For this installation, we use the demo configuration profile. It’s selected to have a good set of defaults for testing, but there are other profiles for production or performance testing.


```bash
istioctl install --set profile=demo
```

Add a namespace label to instruct Istio to automatically inject Envoy sidecar proxies when you deploy your application later:

```bash
echo -e "\n kubectl label namespace default istio-injection=enabled"
kubectl label namespace default istio-injection=enabled
echo -

```
## Deploy the sample application
Deploy the Bookinfo sample application:
```bash
kubectl apply -f samples/bookinfo/platform/kube/bookinfo.yaml
```
The application will start. As each pod becomes ready, the Istio sidecar will deploy along with it.
```bash
watch kubectl get services,pods
```
Verify everything is working correctly up to this point. Run this command to see if the app is running inside the cluster and serving HTML pages by checking for the page title in the response:
```bash
kubectl exec -it $(kubectl get pod -l app=ratings -o jsonpath='{.items[0].metadata.name}') -c ratings -- curl productpage:9080/productpage | grep -o "<title>.*</title>"
```




