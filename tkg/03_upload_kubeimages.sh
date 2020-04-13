#!/bin/bash

source govc-config.sh
env | grep GOVC
govc import.spec photon-3-v1.17.3_vmware.2.ova | jq '.Name="photon-3-v1.17.3_vmware.2"' | jq '.NetworkMapping[0].Network="Demo-Network"' > photon-3-v1.17.3_vmware.2.json
govc import.ova -options=photon-3-v1.17.3_vmware.2.json photon-3-v1.17.3_vmware.2.ova
govc object.mv /$GOVC_DATACENTER/vm/photon-3-v1.17.3_vmware.2 $TKGVMFOLDER

 
govc import.spec photon-3-capv-haproxy-v0.6.3_vmware.1.ova | jq '.Name="photon-3-capv-haproxy-v0.6.3_vmware.1"' | jq '.NetworkMapping[0].Network="Demo-Network"' > photon-3-capv-haproxy-v0.6.3_vmware.1.json 
govc import.ova -options=photon-3-capv-haproxy-v0.6.3_vmware.1.json photon-3-capv-haproxy-v0.6.3_vmware.1.ova
govc object.mv /$GOVC_DATACENTER/vm/photon-3-capv-haproxy-v0.6.3_vmware.1 $TKGVMFOLDER
