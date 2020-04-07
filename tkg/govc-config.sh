# govc pool.create /datacenter/host/compute-cluster-3/Resources/tkg
 
# cat ~/.bash_profile
export GOVC_URL='https://vcenter.psl.local/'
export GOVC_USERNAME='administrator@psl.local'
export GOVC_PASSWORD='VMware1!challagandla'
export GOVC_DATACENTER='sofialab'
export GOVC_NETWORK='VM Network'
export GOVC_DATASTORE= '/vmfs/volumes/4141d8b6-5fde3c9c/'
export GOVC_RESOURCE_POOL='*/Resources'
export GOVC_GUEST_LOGIN='kube:kube'
#'ds:///vmfs/volumes/4141d8b6-5fde3c9c/'
#'datastore-iscsi'
#export GOVC_RESOURCE_POOL='/sofialab/tkgresourcepool
#'/datacenter/host/compute-cluster-3/Resources'
export GOVC_INSECURE=1
 
# govc pool.create /datacenter/host/compute-cluster-3/Resources/tkg
# govc folder.create /datacenter/vm/tkg
