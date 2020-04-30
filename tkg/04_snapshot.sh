#!/bin/bash

source govc-config.sh
 govc snapshot.create -vm ${PHOTON} root
 govc vm.markastemplate ${PHOTON}
 
 govc snapshot.create -vm ${HAPROXY} root
 govc vm.markastemplate ${HAPROXY}
