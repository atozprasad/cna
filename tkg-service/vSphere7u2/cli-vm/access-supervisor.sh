#!/bin/bash
source envionment.sh
kubectl vsphere login --server https://${SUPERVISOR_CLUSTER_IP} --insecure-skip-tls-verify  -u ${SUPERVISOR_CLUSTER_USER} 
kubectl config use-context ${VS_NAMESPACE}
