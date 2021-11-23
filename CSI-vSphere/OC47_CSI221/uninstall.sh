#!/bin/bash

#Step-1 Create configmap in kube-system namespace

oc delete configmap cloud-config --namespace=kube-system

#Step-2 Create Global secret in kube-system namespace

oc delete -f  cpi-global-secret.yaml


#Step-3 delete CPI Roles & CPI Rolebindings

oc delete -f ./cpi-roles.yaml
oc delete -f cpi-role-bindings.yaml

#Step-4.1 Grant scc privillages to the service account cloud-controller-manager

oc adm policy add-scc-to-user privileged -z cloud-controller-manager



##Step-5.2 Create CSI Driver Role, Rolebinding, Deployment
oc delete  -f ./vsphere-csi-driver.yaml

##Step-5.1 Create secret for CSI Driver
oc delete -f  cpi-daemonset.yaml 
oc delete secret generic vsphere-config-secret --namespace=kube-system

#Step-0.1 Create namespace  kube-system
oc delete -f  namespace.yaml
