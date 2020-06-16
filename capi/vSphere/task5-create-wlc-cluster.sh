#!/bin/bash
figlet "Create Workload Cluster"

echo "Generate workload cluster"
echo "clusterctl config cluster capi-wlc1 --infrastructure vsphere --kubernetes-version v1.17.3 --control-plane-machine-count 1 --worker-machine-count 3 > wlc-cluster.yaml"

clusterctl config cluster  capi-wlc1 \
    --infrastructure vsphere \
    --kubernetes-version v1.17.3 \
    --control-plane-machine-count 1 \
    --worker-machine-count 3 > wlc1-cluster.yaml

cat wlc1-cluster.yaml
read
echo "kubectl apply -f wlc1-cluster.yaml"
#kubectl apply -f wlc1-cluster.yaml
#watch  kubectl get clusters

