#!/bin/bash
HOST_IP=10.156.134.95

## Method 1 - Using SSHTunnel
echo -e "\n Use SSH Tunnel from your workstation. For example for mac \n ssh -L 7777:127.0.0.1:7777 -N -f -l ${USER} ${HOST_IP}"
echo -e "\n Press any key to continue ..."
read
octant 

##Method 2 - NAT entry to IPTables 
#BROWSER_CLIENT_IP=10.30.1.243
#SERVER_IP_AND_PORT=${BROWSER_CLIENT_IP}:7777
#echo -e " Change configurations if needed at $0"
#echo "Octant is running at $SERVER_IP_AND_PORT, but connections allowed only from a Browser running at $BROWSER_CLIENT_IP"
#sudo iptables -t nat -A OUTPUT -o ens160 -p tcp -m tcp --dport 7777 -j DNAT --to-destination 127.0.0.1:7777
#export OCTANT_ACCEPTED_HOSTS=$BROWSER_CLIENT_IP
#octant --listener-addr $SERVER_IP_AND_PORT


