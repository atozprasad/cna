#Contour
## Quick installation 
### Command
> kubectl apply -f https://projectcontour.io/quickstart/contour.yaml
> This command creates:
- Namespace contour-operator to run the operator.
- Operator and Contour CRDs
- Operator RBAC resources
- A Deployment to manage the operator
- A Service to front-end the operator’s metrics endpoint.
- Then create an instance of the Contour custom resource:§
### Check for the projectcontour namespace
> kubectl get ns | grep projectcontour
### Deploy a sample app. 
> kubectl apply -f https://projectcontour.io/examples/kuard.yaml
This example specifies a default backend for all hosts, so that you can test your Contour install. It’s recommended for exploration and testing only, however, because it responds to all requests regardless of the incoming DNS that is mapped.
### Send requests to application
There are a number of ways to validate everything is working. The first way is to use the external address of the Envoy service and the second is to port-forward to an Envoy pod:

#### External Address
Retrieve the external address of Contour’s Envoy load balancer:

> kubectl get -n projectcontour service envoy -o wide
### Contour POD 
> CONTOUR_POD=$(kubectl -n projectcontour get pod -l app=contour -o name | head -1)

### Validate HTTPProxy object
>  curl -H 'Host: kuard.local' ${CONTOUR_IP}
> curl -H 'Host: https://tls.contour.local' ${CONTOUR_IP}:443

