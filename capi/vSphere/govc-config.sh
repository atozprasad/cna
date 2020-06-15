#!/bin/bash

IMAGERPO="https://storage.googleapis.com/capv-images"
K8SVERSION="v1.18.2"
HAPVERSION="v1.2.4"
K8SBASE="ubuntu-1804"
HAPBASE="photon-3"
K8SIMAGE=${K8SBASE}"-kube-"${K8SVERSION}""
HAPIMAGE=${HAPBASE}"-haproxy-${HAPVERSION}"
export GOVC_GUEST_LOGIN="kube:kube"
export GOVC_INSECURE=1
######################### Customised variables#####################
export GOVC_URL="10.29.15.135"
#"vcenter.psl.local"
export GOVC_USERNAME="administrator@psl.local"
export GOVC_PASSWORD="VMware1!challagandla"
export GOVC_DATACENTER="sofialab"
export GOVC_NETWORK="VM Network 2"
export GOVC_DATASTORE="NFS"
export NODE_NETWORK="VM Network 2"
#export HAPROXY="photon-3-capv-haproxy-v0.6.3_vmware.1"
export DEPLOYMENT_NAME="capi"
export GOVC_RESOURCE_POOL="/sofialab/host/mgmtcluster/Resources/$DEPLOYMENT_NAME"
export VMFOLDER="/$GOVC_DATACENTER/vm//$DEPLOYMENT_NAME"
export VSPHERE_SSH_AUTHORIZED_KEY="ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDIbR/1IAH1zX1cB52BWA9zqdPr+VVuyRgzR2fZ4GF5IoAVhNzdtu8KQqedmRk635UVXp33ShkKtnYnroQiTv3WflQk+9V5LAFcGstq5cbnNxyXAVJS6JP2y9okJOXax9dicXyHp0GSypdxeP0X39Wy6vBW8+R/33NR0nurvbhwCugBd5mRaBZQPkoXtouISEjK8fYRFFEDv0K3DVJw4iei/dwnrO/OM1FhxI6IuyfHVEFI+fKnZJvZWwWMokexNd3X6mn+lMPPDP6zwTeVFBPub51RDKRglAbGci0cc33hd8/8080zN6BZ+mOOZIK68YmAaJxkZReiT01RcQeSwOOZ administrator@playground"

