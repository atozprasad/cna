#!/bin/bash
clear;
figlet "DEMO : CONTOUR TLSpassthrough"
echo -e "Step1 : Cleaning existing TLSpassthrough demo resources"
kubectl delete -f  ./TLSpassthrough.yaml
echo -e "\n NextStep...";read;

echo -e "\n Lets check if we have any HTTPProxy objects already...";
kubectl get httpproxy
echo -e "\n NextStep...";read;clear

figlet "1. Apply YAML file with secret"
echo -e "\n Les examine the file ./TLSpassthrough.yaml ...";read;clear;

more ./TLSpassthrough.yaml
echo -e "\n Apply ./TLSpassthrough.yaml ...";read;
kubectl apply -f ./TLSpassthrough.yaml
echo -e "\n NextStep...";read; clear;

echo -e "\n Lets Check the necessary objects been created or not"
echo -e "kubectl get httpproxy"
kubectl get httpproxy
echo -e "\n NextStep...";read;


echo -e "\n\nkubectl get pods,svc,ingress -l app=tlspassthrough"
kubectl get pods,svc,ingress -l app=tlspassthrough
echo -e "\n NextStep...";read;

echo -e "\n\n Lets browse the app curl -v -k -H 'HOST:passthrough.contour.local' https://passthrough.contour.local"
curl -v -k -H 'HOST:passthrough.contour.local' https://passthrough.contour.local
echo -e "\n NextStep...";read;


# Next step to try with HTTPS version https://hub.docker.com/r/mendhak/http-https-echo

