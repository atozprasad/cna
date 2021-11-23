#!/bin/bash
oc delete -f yelb-lb.yaml
oc delete -f https-secret.yaml
kubectl delete -f yelb-ui-svc-np.yaml
kubectl delete -f https-secret.yaml
kubectl delete -f http-ingress-overlb.yaml
kubectl  delete -f https-ingress-overnp.yaml  

#oc-scc-adm.yaml 
#yelb-ui-cip.yaml
#http-ingress-overlb.yaml   
#https-secret.yaml  
#https-ingress-overnp.yaml  
#yelb-nodeport.yaml
#http-ingress-overnp.yaml   
#yelb-lb.yaml 
#yelb-ui-np.yaml

