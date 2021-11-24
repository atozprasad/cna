#!/bin/bash
source ./vsphere.conf

kubectl taint nodes ${OCP_VM_PREFIX} node-role.kubernetes.io/master=:NoSchedule

kubectl describe nodes | egrep "Taints:|Name:"
