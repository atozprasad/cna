#!/bin/bash 
for p in $(kubectl get pods --namespace=kube-system -l k8s-app=kube-dns -o name); do kubectl logs --namespace=kube-system $p; done

#if incase kube-dns is not running, that could be a firewall issue. To resolve the firewall issue on Ubuntu following the below steps
## Login to each worker node
## disable the firewall using "sudo ufw disable"
