kubectl get po,svc,ing -l app=kuard
kubectl get ingress.extensions/kuard -o=jsonpath="{.items[*]['status.loadBalancer.ingress'][0].ip}"

