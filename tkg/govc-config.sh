#!/bin/bash
export GOVC_URL='vcenter.psl.local'
export GOVC_USERNAME='administrator@psl.local'
export GOVC_PASSWORD='VMware1!challagandla'
export GOVC_DATACENTER='sofialab'
export GOVC_NETWORK='VM Network'
export GOVC_DATASTORE='NFS'
export GOVC_RESOURCE_POOL='/sofialab/host/NestedHosts/Resources'
export GOVC_GUEST_LOGIN='kube:kube'
export GOVC_INSECURE=1
