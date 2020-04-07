#!/bin/bash

source govc-config.sh
govc import.spec photon-3-v1.17.3+vmware.1.ova | jq '.Name="photon-3-v1.17.3+vmware.1"' | jq '.NetworkMapping[0].Network="Demo-Network"' > photon-3-v1.17.3+vmware.1.json
govc import.ova -options=photon-3-v1.17.3+vmware.1.json photon-3-v1.17.3+vmware.1.ova
govc object.mv /datacenter/vm/photon-3-v1.17.3+vmware.1 /datacenter/vm/tkg
 
govc import.spec photon-3-capv-haproxy-v0.6.2+vmware.2.ova | jq '.Name="photon-3-capv-haproxy-v0.6.2+vmware.2"' | jq '.NetworkMapping[0].Network="Demo-Network"' > photon-3-capv-haproxy-v0.6.2+vmware.2.json
govc import.ova -options=photon-3-capv-haproxy-v0.6.2+vmware.2.json photon-3-capv-haproxy-v0.6.2+vmware.2.ova
govc object.mv /datacenter/vm/photon-3-capv-haproxy-v0.6.2+vmware.2 /datacenter/vm/tkg
