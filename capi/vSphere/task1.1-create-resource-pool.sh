#!/bin/bash
figlet "Create vSphere Resource Pool"
source ./govc-config.sh
echo -e "\n govc pool.create $GOVC_RESOURCE_POOL"
#Create a resource pool
govc pool.create $GOVC_RESOURCE_POOL
#Create a folder 
echo -e "\n NextStep...";read;
echo -e "\n Create a folder"
echo -e "\n govc folder.create $VMFOLDER"
govc folder.create $VMFOLDER

figlet "Done with the task"
