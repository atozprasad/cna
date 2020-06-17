#Ensure nodeip pool isnot falling in the 192.168.0.0/16, since it is the default configuration from Calico
kubectl get ClusterRole calico-node
kubectl get ClusterRoleBinding calico-node
kubectl get clusterrole -A | grep -i calico
kubectl get clusterrole calico-node -o yaml
kubectl get ippools

#From that it looks like the proper service DNAT rules are present assuming your master is at 192.168.50.10. Does a curl to 192.168.50.10:6443 (using the same path previously use) work?
#If that works I'm a little at a loss as to what is wrong here. I expect the curl above will work because the kubelet running on that same node is reaching 192.168.50.10.
#I noticed that it looks like the pod IP Cidr 192.168.0.0/16 overlaps with the addresses of your nodes, while I don't think that will cause a problem maybe it is? If the curl above works then I'd consider changing the pod IP Cidr and see if that is the fix.
