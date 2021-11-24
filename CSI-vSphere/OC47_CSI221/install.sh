#!/bin/bash


echo -e "\n Generating 2 files (1) csi-vsphere.conf (2) vsphere.conf"
./generate_conf.sh
ls -lrt csi-vsphere.conf vsphere.conf

#Step -01 Preparenodes
./prepareNodes.sh

#Step-0.2 Generate vsphere.conf and csi-vsphere.conf

./generate_conf.sh

#Step-1 Create configmap in kube-system namespace

kubectl taint nodes <k8s-primary-name> node-role.kubernetes.io/master=:NoSchedule

oc create configmap cloud-config --from-file=./vsphere.conf --namespace=kube-system

#Step-2 Create Global secret in kube-system namespace

oc create -f  cpi-global-secret.yaml


#Step-3 create CPI Roles & CPI Rolebindings

oc create -f ./cpi-roles.yaml
oc create -f cpi-role-bindings.yaml

#Step-4.1 Grant scc privillages to the service account cloud-controller-manager

oc adm policy add-scc-to-user privileged -z cloud-controller-manager
oc adm policy add-scc-to-user privileged -z vsphere-csi-controller -n kube-system
oc adm policy add-scc-to-user privileged -z vsphere-csi-node -n kube-system


##Step-4.2 Create CPI Deamonset

oc create -f  cpi-daemonset.yaml

##Step-5.1 Create secret for CSI Driver
oc create secret generic vsphere-config-secret --from-file=./csi-vsphere.conf --namespace=kube-system
##Step-5.2 Create CSI Driver Role, Rolebinding, Deployment
oc create -f ./vsphere-csi-driver.yaml
