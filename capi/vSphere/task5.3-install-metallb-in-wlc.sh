#!/bin/bash
source wlc.env
figlet "Deploy MetalLB loadbalancer"
kubectl apply -f https://raw.githubusercontent.com/google/metallb/v0.8.1/manifests/metallb.yaml
cat >> metallb-configmap.yaml <<EOF
apiVersion: v1
kind: ConfigMap
metadata:
  namespace: metallb-system
  name: config
data:
  config: |
    address-pools:
    - name: default
      protocol: layer2
      addresses:
      - 192.168.1.5-192.168.1.25
EOF
echo  -e "\n Config for MetalLB"
cat metallb-configmap.yaml
kubectl apply -f metallb-configmap.yaml
kubectl get  all -n metallb-system
figlet "Done with the MetalLB installation"
echo -e "\n NextStep...";read;clear

