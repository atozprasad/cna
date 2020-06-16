#!/bin/bash
source govc-config.sh

figlet "Generate clusterctl.yaml"
## -- Controller settings -- ##
echo "" > clusterctl.yaml
echo "VSPHERE_USERNAME: \"$GOVC_USERNAME\""   >> clusterctl.yaml                 # The username used to access the remote vSphere endpoint
echo "VSPHERE_PASSWORD: \"$GOVC_PASSWORD\"" >> clusterctl.yaml                                 # The password used to access the remote vSphere endpoint
## -- Required workload cluster default settings -- ##
echo "VSPHERE_SERVER: \"$GOVC_URL\"" >> clusterctl.yaml                                   # The vCenter server IP or FQDN
echo "VSPHERE_DATACENTER: \"$GOVC_DATACENTER\"" >> clusterctl.yaml                        # The vSphere datacenter to deploy the management cluster on
echo "VSPHERE_DATASTORE: \"$GOVC_DATASTORE\"" >> clusterctl.yaml                        # The vSphere datastore to deploy the management cluster on
echo "VSPHERE_NETWORK: \"$GOVC_NETWORK\"" >> clusterctl.yaml                                # The VM network to deploy the management cluster on
echo "VSPHERE_RESOURCE_POOL: \"$GOVC_RESOURCE_POOL\"" >> clusterctl.yaml                         # The vSphere resource pool for your VMs
echo "VSPHERE_FOLDER: \"$VMFOLDER\""  >> clusterctl.yaml                                        # The VM folder for your VMs. Set to "" to use the root vSphere folder
echo "VSPHERE_TEMPLATE: \"$K8SIMAGE\"" >> clusterctl.yaml                 # The VM template to use for your management cluster.
echo "VSPHERE_HAPROXY_TEMPLATE: \"$HAPIMAGE\"">> clusterctl.yaml  # The VM template to use for the HAProxy load balancer
echo "VSPHERE_SSH_AUTHORIZED_KEY: \"$VSPHERE_SSH_AUTHORIZED_KEY\"" >> clusterctl.yaml              # The public ssh authorized key on all machines
                                                              #   in this cluster.
                                                              #   Set to "" if you don't want to enable SSH,
                                                              #   or are using another solution.

cat clusterctl.yaml
mkdir -p ~/.cluster-api/
cp clusterctl.yaml ~/.cluster-api/
figlet "Done with this task"
