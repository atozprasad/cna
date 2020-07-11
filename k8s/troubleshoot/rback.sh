#!/bin/bash
kubectl auth can-i create pods
kubectl auth can-i create pods --as=capi-wlc1-admin
kubectl get rolebindings -A
kubectl get roles -A
kubectl get clusterrole -A #Cluster role
