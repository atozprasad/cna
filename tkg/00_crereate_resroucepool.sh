source ./govc-config.sh
#List all the RESROUCE POOLS
govc pool.info */Resources | grep path
#Create a resource pool
govc pool.create $GOVC_RESOURCE_POOL
#Create a folder 
govc folder.create $TKGVMFOLDER
