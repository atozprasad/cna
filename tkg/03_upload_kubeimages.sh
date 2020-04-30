#!/bin/bash
source govc-config.sh
env | grep GOVC

govc import.spec  ${PHOTON}.ova | jq ".Name=\"${PHOTON}\"" | jq ".NetworkMapping[0].Network=\"$NODE_NETWORK\""  > ${PHOTON}.json
govc import.ova -options=${PHOTON}.json ${PHOTON}.ova
govc object.mv /$GOVC_DATACENTER/vm/${PHOTON} $TKGVMFOLDER

govc import.spec ${HAPROXY}.ova | jq ".Name=\"${HAPROXY}\"" | jq ".NetworkMapping[0].Network=\"$NODE_NETWORK\""  > ${HAPROXY}.json
govc import.ova -options=${HAPROXY}.json ${HAPROXY}.ova
govc object.mv /$GOVC_DATACENTER/vm/${HAPROXY} $TKGVMFOLDER
