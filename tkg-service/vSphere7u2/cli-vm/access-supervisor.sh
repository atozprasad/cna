#!/bin/bash
source enviornment.sh
kubectl vsphere login --server $SUPERVISOR_CLUSTER_IP -u $PRE_USER_NAME
KUBECTL_VSPHERE_PASSWORD=P@ssw0rd 
kubectl vsphere login --server https://10.198.53.128 --insecure-skip-tls-verify -u administrator@vsphere.local
