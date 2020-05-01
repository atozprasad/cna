#!/bin/bash
source govc-config.sh

echo -e "\n####Invoking tkginit #######\n"
#tkg init --ui -v 6
#tkg init --ui
CLUSTERNAME="$DEPLOYMENT_NAME""-mgmt"
echo "tkg init -i vsphere -p dev --name $CLUSTERNAME"
tkg init -i vsphere -p dev --name $CLUSTERNAME


