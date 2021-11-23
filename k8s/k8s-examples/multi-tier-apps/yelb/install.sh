#!/bin/bash
oc apply -f oc-scc-adm.yaml
oc adm policy add-scc-to-user privileged -z default
oc apply -f yelb-lb.yaml

kubectl apply -f yelb-ui-svc-np.yaml
oc apply -f https-secret.yaml
kubectl apply -f https-ingress-overnp.yaml  

watch oc get all -n yelb

kubectl get ingress 

oc get routes

