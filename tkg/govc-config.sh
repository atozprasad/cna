#!/bin/bash
# cat ~/.bash_profile
export GOVC_URL='vcenter.psl.local'
export GOVC_USERNAME='administrator@psl.local'
export GOVC_PASSWORD='VMware1!challagandla'
export GOVC_DATACENTER='sofialab'
export GOVC_NETWORK='VM Network 2'
export GOVC_DATASTORE='NFS'
#nesxi03Datastore01'
#export GOVC_RESOURCE_POOL='*/Resources'
export GOVC_RESOURCE_POOL='/sofialab/host/mgmtcluster/Resources'
#'/sofialab/host/10.29.15.132/Resources'
export TKGVMFOLDER="/$GOVC_DATACENTER/vm/tkgtsm"
export GOVC_GUEST_LOGIN='kube:kube'
export GOVC_INSECURE=1
export NODE_NETWORK="VM Network 2"
export PHOTON="photon-3-v1.17.3_vmware.2"
export HAPROXY="photon-3-capv-haproxy-v0.6.3_vmware.1"

