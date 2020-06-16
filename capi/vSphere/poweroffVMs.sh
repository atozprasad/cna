#!/bin/bash
RESOURCEPOOL_NAME="tgktsm"
VMLIST=`govc find ./vm/tkgtsm`
govc find ./vm/tkgtsm > poweroff_vms.list
#VMLIST=`govc find ./vm/${RESOURCEPOOL_NAME}`
echo $VMLIST1
for i in "${VMLIST1[@]}"
do
	echo -e "\n Invoking poweroff for $i"
echo -e "\n LIST ${i}" 
	#govc vm.power -off -force  $i

done
