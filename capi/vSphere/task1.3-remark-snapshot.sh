#!/bin/bash
#Download bits
figlet "Upload images to vSphere"
source govc-config.sh

govc vm.markasvm -pool ${GOVC_RESOURCE_POOL} ${K8SIMAGE}
# Take a snapshot of the VM
govc snapshot.create -vm ${K8SIMAGE} root
# Re-mark the VM as a template
govc vm.markastemplate ${K8SIMAGE}

# Re-mark the template as a VM
govc vm.markasvm -pool ${GOVC_RESOURCE_POOL} ${HAPIMAGE}
# Take a snapshot of the VM
govc snapshot.create -vm ${HAPIMAGE} root
# Re-mark the VM as a template
govc vm.markastemplate ${HAPIMAGE}
