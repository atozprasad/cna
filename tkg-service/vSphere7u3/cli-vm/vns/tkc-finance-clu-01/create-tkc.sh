#!/bin/bash
clear
source ../vns/vns.env
kubectl vsphere login --server https://${SUPERVISOR_CLUSTER_IP} --insecure-skip-tls-verify  -u ${VS_NS_USER}

## Login as VSN_ADMIN
source tkc-cluster.conf
rm -f create-tkc.yaml temp.yaml
( echo "cat <<EOF >create-tkc.yaml";
  cat create-tkc.yaml.template;
  echo "EOF";
) >temp.yaml
. temp.yaml
cat create-tkc.yaml
read -p "Press enter to apply the TKC Cluster creation yaml ... "
kubectl apply -f create-tkc.yaml
rm temp.yaml 
#rm create-tkc.yaml



### Create Cluster role
source ../vns/vns.env
kubectl vsphere login --server https://${SUPERVISOR_CLUSTER_IP} --insecure-skip-tls-verify  -u ${VS_NS_USER}
kubectl create clusterrolebinding default-tkg-admin-privileged-binding --clusterrole=psp:vmware-system-privileged --group=system:authenticated

