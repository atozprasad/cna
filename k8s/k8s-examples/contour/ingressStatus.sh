#!/bin/bash

kubectl get po,svc,ing -l app=kuard

#kubectl get ingress.extensions/kuard -o=jsonpath="{.status.loadBalancer.ingress[0].ip}"
export CONTOUR_IP=`kubectl get ingress.extensions/kuard -o=jsonpath="{.status.loadBalancer.ingress[0].ip}"`



figlet "Let's validate the http route using k8s  ingress"
echo -e "\n\n\n\n\n"
echo "curl -H 'Host: kuard.local' ${CONTOUR_IP}"
echo -e "\n\n\n\n\n"
echo -e "\n Press any key..."
read 
curl -H 'Host: kuard.local' ${CONTOUR_IP}




#TBD
#kubectl get svc -o=jsonpath="{.items[*]['status.loadBalancer.ingress'][0].ip}"

