#!/bin/bash
source envionment.sh
source tkc-environment.sh
kubectl vsphere login --server https://${SUPERVISOR_CLUSTER_IP} --insecure-skip-tls-verify  -u ${PRE_USER_NAME} --tanzu-kubernetes-cluster-name  ${TKC_CLUSTER_NAME}
kubectl config use-context ${TKC_CLUSTER_NAME}
