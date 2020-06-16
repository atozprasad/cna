#!/bin/bash
WLC_CLUSTER_NAME="capi-wlc1"
unset KUBECONFIG
echo "export WLC_CLUSTER_NAME=${WLC_CLUSTER_NAME}" > wlc.env
source wlc.env

figlet "Create Workload Cluster"
echo "Generate workload cluster"
echo "clusterctl config cluster ${WLC_CLUSTER_NAME}--infrastructure vsphere --kubernetes-version v1.17.3 --control-plane-machine-count 1 --worker-machine-count 3 > ${WLC_CLUSTER_NAME}.yaml"

clusterctl config cluster ${WLC_CLUSTER_NAME} \
    --infrastructure vsphere \
    --kubernetes-version v1.18.2 \
    --control-plane-machine-count 1 \
    --worker-machine-count 3 > ${WLC_CLUSTER_NAME}.yaml

cat ${WLC_CLUSTER_NAME}.yaml
read
echo "kubectl apply -f ${WLC_CLUSTER_NAME}.yaml"
kubectl apply -f ${WLC_CLUSTER_NAME}.yaml
watch  kubectl get clusters

