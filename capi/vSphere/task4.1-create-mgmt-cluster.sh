#!/bin/bash
MGMT_CLUSTER_NAME="capi-mgmt"
unset KUBECONFIG
echo "export MGMT_CLUSTER_NAME=${MGMT_CLUSTER_NAME}" > mgmt.env
source mgmt.env

figlet "Create mgmt Cluster"
echo "Generate conf for mgmt  cluster"
echo "clusterctl config cluster ${MGMT_CLUSTER_NAME}--infrastructure vsphere --kubernetes-version v1.17.3 --control-plane-machine-count 1 --worker-machine-count 3 > ${WLC_CLUSTER_NAME}.yaml"

clusterctl config cluster ${MGMT_CLUSTER_NAME} \
    --infrastructure vsphere \
    --kubernetes-version v1.18.2 \
    --control-plane-machine-count 1 \
    --worker-machine-count 3 > ${MGMT_CLUSTER_NAME}.yaml

cat ${MGMT_CLUSTER_NAME}.yaml
read
echo "kubectl apply -f ${MGMT_CLUSTER_NAME}.yaml"
kubectl apply -f ${MGMT_CLUSTER_NAME}.yaml
watch  kubectl get clusters

