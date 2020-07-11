#!/bin/bash
source govc-config.sh

# Get all the VMs in a folder
FOLDER='/sofialab/vm/tkgtsm/'

RESULT=`govc ls -l=true ${FOLDER}  | awk {'print $1'}`

VMLIST=($(echo "$RESULT" | tr ' ' '\n'))

for i in "${VMLIST[@]}"
do
   echo "Powering off ${i}" 
   govc vm.power -off=true ${i}

   # do whatever on $i
done

