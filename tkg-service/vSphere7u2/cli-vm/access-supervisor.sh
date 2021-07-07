#!/bin/bash
source envionment.sh
kubectl vsphere login --server https://${SUPERVISOR_CLUSTER_IP} --insecure-skip-tls-verify  -u ${PRE_USER_NAME}
kubectl config use-context ${VS_NAMESPACE}
