#!/bin/bash 
for p in $(kubectl get pods --namespace=kube-system -l k8s-app=kube-proxy -o name); do kubectl logs --namespace=kube-system $p; done
