#!/bin/bash
# cat ~/.bash_profile
export GOVC_URL='vcenter.psl.local'
export GOVC_USERNAME='administrator@psl.local'
export GOVC_PASSWORD='VMware1!challagandla'
export GOVC_DATACENTER='sofialab'
export GOVC_NETWORK='VM Network 2'
export GOVC_DATASTORE='nesxi03Datastore01'
#export GOVC_RESOURCE_POOL='*/Resources'
export GOVC_RESOURCE_POOL='/sofialab/host/mgmtcluster/Resources'
#'/sofialab/host/10.29.15.132/Resources'
export TKGVMFOLDER="/$GOVC_DATACENTER/vm/tkgrc3"
export GOVC_GUEST_LOGIN='kube:kube'
export GOVC_INSECURE=1

