#!/bin/bash

oc delete secrete vsphere-config-secret --namespace=vmware-system-csi
oc delete configmap cloud-config vmware-system-csi

oc delete secret vsphere-config-secret  -n kube-system
oc delete configmap cloud-config -n kube-system
oc delete secret vsphere-config-secret --namespace=vmware-system-csi
oc delete configmap cloud-config --namespace=vmware-system-csi

echo -e "\n Create the CPI (RBAC, Bindings, Deployment and DaemonSet) "

oc delete -f cloud-controller-manager-roles.yaml
oc delete -f cloud-controller-manager-role-bindings.yaml
oc delete -f vsphere-cloud-controller-manager-ds.yaml

oc delete -f vsphere-csi-driver.yaml

oc delete ns vmware-system-csi

