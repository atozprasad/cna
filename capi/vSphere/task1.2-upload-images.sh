#!/bin/bash
#Download bits
figlet "Upload images to vSphere"
source govc-config.sh

govc import.spec  ${K8SIMAGE}.ova | jq ".Name=\"${K8SIMAGE}\"" | jq ".NetworkMapping[0].Network=\"$NODE_NETWORK\""  > ${K8SIMAGE}.json
govc import.ova -options=${K8SIMAGE}.json ${K8SIMAGE}.ova
govc object.mv /$GOVC_DATACENTER/vm/${K8SIMAGE} $VMFOLDER

govc import.spec ${HAPIMAGE}.ova | jq ".Name=\"${HAPIMAGE}\"" | jq ".NetworkMapping[0].Network=\"$NODE_NETWORK\""  > ${HAPIMAGE}.json
govc import.ova -options=${HAPIMAGE}.json ${HAPIMAGE}.ova
govc object.mv /$GOVC_DATACENTER/vm/${HAPIMAGE} $VMFOLDER
