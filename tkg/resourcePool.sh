# govc pool.create /datacenter/host/compute-cluster-3/Resources/tkg
 
# cat ~/.bash_profile
export GOVC_URL='vcenter.psl.local'
export GOVC_USERNAME='administrator@psl.local'
export GOVC_PASSWORD='VMware1!challagandla'
export GOVC_DATACENTER='sofialab'
export GOVC_NETWORK='VM Network'
export GOVC_DATASTORE='NFS'
#export GOVC_RESOURCE_POOL='*/Resources'
export GOVC_RESOURCE_POOL='/sofialab/host/NestedHosts/Resources'
#'/sofialab/host/10.29.15.132/Resources'
export GOVC_GUEST_LOGIN='kube:kube'
export GOVC_INSECURE=1
#export GOVC_RESOURCE_POOL='/sofialab/tkgresourcepool
#List all the RESROUCE POOLS
govc pool.info */Resources | grep path
#Create a resource pool
govc pool.create $GOVC_RESOURCE_POOL/tkg 
#Create a folder 
govc folder.create $GOVC_DATACENTER/vm/tkg
#Import OVA
govc import.spec ubuntu-1804-kube-v1.16.2.ova | jq '.name="ubuntu-1804-kube-v1.16.2"' | jq '.NetworkMapping[0].Network="VM Network"' > ubuntu-1804-kube-v1.16.2.json
#Display ova metainfo
cat ubuntu-1804-kube-v1.16.2.json
#upload OVA
govc import.ova -pool=$GOVC_RESOURCE_POOL/tkg -options=ubuntu-1804-kube-v1.16.2.json ubuntu-1804-kube-v1.16.2.ova
#Move the ova to /vm/tkg folder
govc object.mv $GOVC_DATACENTER/vm/ubuntu-1804-kube-v1.16.2 $GOVC_DATACENTER/vm/tkg
