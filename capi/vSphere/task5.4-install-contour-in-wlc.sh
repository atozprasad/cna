#!/bin/bash
source wlc.env

figlet "Deploy Contour Ingress & HTTPProxy"
echo -e "\n kubectl apply  -f https://projectcontour.io/quickstart/contour.yaml"
kubectl apply  -f https://projectcontour.io/quickstart/contour.yaml 
figlet "Done with the Contour Ingress installation"
echo -e "\n  watch kubectl get all -n projectcontour"
watch kubectl get all -n projectcontour
echo -e "\n NextStep...";read;clear


