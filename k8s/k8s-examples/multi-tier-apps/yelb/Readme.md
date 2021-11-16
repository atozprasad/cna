## Yelb with Nodeport
###Step 1 - Deploy the application

kubectl create ns yelb
kubectl apply -f https://raw.githubusercontent.com/lamw/vmware-k8s-app-demo/master/yelb.yaml

###Step 2 - Verify all pods are ready

kubectl -n yelb get pods

###Step 3 - To access the application, open web browser to http://<ip>:30001

kubectl -n yelb describe pod $(kubectl -n yelb get pods | grep yelb-ui | awk '{print $1}') | grep "Node:"

##LoadBalancer Service Deployment:

###Step 1 - Deploy the application

kubectl create ns yelb
kubectl apply -f https://raw.githubusercontent.com/lamw/vmware-k8s-app-demo/master/yelb-lb.yaml

###Step 2 - Verify all pods are ready

kubectl -n yelb get pods

###Step 3 - To access the application, open web browser to http://<external-ip>

kubectl -n yelb get svc/yelb-ui

Note: It is expected that your K8s cluster can support a LoadBalancer Service
