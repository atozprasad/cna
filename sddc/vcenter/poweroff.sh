#!/bin/bash
source govc-config.sh
RESOURCEPOOL_NAME=""
CLUSTER_NAME=""
VM_NAME=""

usage()
{
    echo "usage: poweroff [[[-cn cluster name] [-rp resorucepool Name] [-vn virtualmahcine name]] | [-h]]"
    echo "example :  poweroff.sh -cn sofialab -rp tkgtsm "
}

while [ "$1" != "" ]; do
    case $1 in
	-cn | --clustername ) shift
				CLUSTER_NAME=$1
				;;
        -rp | --resourcepool )  shift
                                RESOURCEPOOL_NAME=$1
                                ;;
        -vn | --vmname )    	shift
				VM_NAME=$1
                                ;;
        -h | --help )           usage
                                exit
                                ;;
        * )                     usage
                                exit 1
    esac
    shift
done
if [ -n ${CLUSTER_NAME} ] && [ -n ${RESOURCEPOOL_NAME} ] ; then

	FOLDER_NAME="/${CLUSTER_NAME}/vm/${RESOURCEPOOL_NAME}"
else
	usage
	exit
fi


if [ -n ${CLUSTER_NAME} ] && [ -n ${RESOURCEPOOL_NAME} ]   && [ -z ${VM_NAME} ]; then
	echo "All VMs in ${FOLDER_NAME}"
	#VMLIST=`govc find ${RESOURCEPOOL_NAME}`

	RESULT=`govc ls -l=true ${FOLDER_NAME}  | awk {'print $1'}`
	VMLIST=($(echo "$RESULT" | tr ' ' '\n'))
	echo $VMLIST
	for i in "${VMLIST[@]}"; do
		echo -e "\n Invoking poweroff for $i"
		echo -e "\n LIST ${i}" 
		govc vm.power -off -force  $i
	done
elif [-n ${FOLDER_NAME} ]   && [ -n ${VM_NAME} ]; then
	govc vm.power -off -force "${FOLDER_NAME}/${VM_NAME}"
	echo "resource pool and VMName"
else	
		usage
		exit
fi
