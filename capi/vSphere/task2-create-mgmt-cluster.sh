#!/bin/bash
figlet "Management Cluster Creation"
source govc-config.sh

echo "clusterctl init --infrastructure vsphere"

clusterctl init --infrastructure vsphere

