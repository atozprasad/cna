#!/bin/bash

#Reference documentaiton 
##  (1) https://developer.vmware.com/samples/7399/container-storage-interface-driver-for-vsphere-6-x-7-x-and-openshift-container-platform-4-x#
## (2) https://github.com/saintdle/vSphere-CSI-Driver-2.0-OpenShift-4

cat > namespace.yaml <<EOF
apiVersion: v1
kind: Namespace
metadata:
  name: vmware-system-csi
EOF

echo -e "\n Generating 2 files (1) csi-vsphere.conf (2) vsphere.conf"
./generate_conf.sh
ls -lrt csi-vsphere.conf vsphere.conf

echo -e "\n Creating namespace vmware-system-csi"
oc apply -f namespace.yaml 

echo -e "\n Creating K8S Secret and configmap objecfts"

oc create secret generic vsphere-config-secret --from-file=csi-vsphere.conf --namespace=kube-system
oc create configmap cloud-config --from-file=vsphere.conf --namespace=kube-system
oc create secret generic vsphere-config-secret --from-file=csi-vsphere.conf --namespace=vmware-system-csi
oc create configmap cloud-config --from-file=vsphere.conf --namespace=vmware-system-csi

echo -e "\n Create the CPI (RBAC, Bindings, Deployment and DaemonSet) "

oc apply -f cloud-controller-manager-roles.yaml
oc apply -f cloud-controller-manager-role-bindings.yaml
oc apply -f vsphere-cloud-controller-manager-ds.yaml

echo -e "\n Create the CPI (RBAC, Bindings, Deployment and DaemonSet) "
#Reference location 
## https://raw.githubusercontent.com/kubernetes-sigs/vsphere-csi-driver/v2.4.0/manifests/vanilla/vsphere-csi-driver.yaml
## https://github.com/kubernetes-sigs/vsphere-csi-driver/tree/master/manifests/guestcluster/1.22/pvcsi.yaml

oc apply -f vsphere-csi-driver.yaml
#oc apply -f vsphere-csi-driver_2_3.yaml

echo "Validate Objects 1 secret vsphere-config-secret"
kubectl describe csidrivers
kubectl get secret vsphere-config-secret --namespace=vmware-system-csi 
kubectl get deployment --namespace=vmware-system-csi
kubectl get CSINode

