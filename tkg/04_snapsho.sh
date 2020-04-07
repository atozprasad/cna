#!/bin/bash
 govc snapshot.create -vm photon-3-v1.17.3+vmware.1 root
 govc vm.markastemplate photon-3-v1.17.3+vmware.1
 
 govc snapshot.create -vm photon-3-capv-haproxy-v0.6.2+vmware.2 root
 govc vm.markastemplate photon-3-capv-haproxy-v0.6.2+vmware.2
