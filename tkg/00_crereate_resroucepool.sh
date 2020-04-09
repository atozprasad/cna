#!/bin/bash
# govc pool.create /datacenter/host/compute-cluster-3/Resources/tkg
 
# cat ~/.bash_profile
#export GOVC_URL='vcenter.psl.local'
#export GOVC_USERNAME='administrator@psl.local'
#export GOVC_PASSWORD='VMware1!challagandla'
#export GOVC_DATACENTER='sofialab'
#export GOVC_NETWORK='VM Network 2'
#export GOVC_DATASTORE='LocalDatastore06'
#export GOVC_RESOURCE_POOL='/sofialab/host/NestedHosts/Resources'
#export GOVC_GUEST_LOGIN='kube:kube'
#export GOVC_INSECURE=1
source ./govc-config.sh
#List all the RESROUCE POOLS
govc pool.info */Resources | grep path
#Create a resource pool
govc pool.create $GOVC_RESOURCE_POOL/tkgRC3 
#Create a folder 
govc folder.create $VMFOLDER
