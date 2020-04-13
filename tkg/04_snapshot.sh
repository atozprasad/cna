#!/bin/bash

source govc-config.sh
 govc snapshot.create -vm photon-3-v1.17.3_vmware.2 root
 govc vm.markastemplate photon-3-v1.17.3_vmware.2
 
 govc snapshot.create -vm photon-3-capv-haproxy-v0.6.3_vmware.1 root
 govc vm.markastemplate photon-3-capv-haproxy-v0.6.3_vmware.1
