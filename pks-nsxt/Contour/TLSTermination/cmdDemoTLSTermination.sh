#!/bin/bash
clear;
figlet "DEMO : CONTOUR TLS_TERMINATION"
echo -e "Step1 : Cleaning existing TLS_TERMINATION demo resources"
kubectl delete -f  ./TLStermination.yaml
echo -e "\n NextStep...";read;

echo -e "\n Lets check if we have any HTTPProxy objects already...";
kubectl get httpproxy
echo -e "\n NextStep...";read;clear

figlet "1. Apply YAML file with secret"
echo -e "\n Les examine the file ./TLStermination.yaml ...";read;clear;

more ./TLStermination.yaml
echo -e "\n Apply ./TLStermination.yaml ...";read;
kubectl apply -f ./TLStermination.yaml
echo -e "\n NextStep...";read; clear;

echo -e "\n Lets Check the necessary objects been created or not"
echo -e "kubectl get httpproxy"
kubectl get httpproxy
echo -e "\n NextStep...";read;

echo -e "\n\nkubectl get secret contour-secret"
kubectl get secret contour-secret
echo -e "\n NextStep...";read;

echo -e "\n\nkubectl get pods,svc,ingress -l app=tls_termination"
kubectl get pods,svc,ingress -l app=tlsterminate
echo -e "\n NextStep...";read;

echo -e "\n\n Lets browse the app curl -v -k -H 'HOST:tls.contour.local' https://tls.contour.local"
curl -v -k -H 'HOST:tls.contour.local' https://tls.contour.local
echo -e "\n NextStep...";read;


