#!/bin/bash
#Download bits
figlet "Upload images to vSphere"
source govc-config.sh

govc import.spec  ${K8SIMAGE}.ova | jq ".Name=\"${K8SIMAGE}\"" | jq ".NetworkMapping[0].Network=\"$NODE_NETWORK\""  > ${K8SIMAGE}.json
govc import.ova -options=${K8SIMAGE}.json ${K8SIMAGE}.ova
govc object.mv /$GOVC_DATACENTER/vm/${K8SIMAGE} $VMFOLDER

# Re-mark the template as a VM
govc vm.markasvm -pool Compute-ResourcePool ${K8SIMAGE}
# Take a snapshot of the VM
govc snapshot.create -vm ${K8SIMAGE} root
# Re-mark the VM as a template
govc vm.markastemplate ${K8SIMAGE}

govc import.spec ${HAPIMAGE}.ova | jq ".Name=\"${HAPIMAGE}\"" | jq ".NetworkMapping[0].Network=\"$NODE_NETWORK\""  > ${HAPIMAGE}.json
govc import.ova -options=${HAPIMAGE}.json ${HAPIMAGE}.ova
govc object.mv /$GOVC_DATACENTER/vm/${HAPIMAGE} $VMFOLDER

# Re-mark the template as a VM
govc vm.markasvm -pool Compute-ResourcePool ${HAPIMAGE}
# Take a snapshot of the VM
govc snapshot.create -vm ${HAPIMAGE} root
# Re-mark the VM as a template
govc vm.markastemplate ${HAPIMAGE}
