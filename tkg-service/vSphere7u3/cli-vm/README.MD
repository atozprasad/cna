1.	Few commands for handy

-	Login to Supervisor Cluster : 
o	Set the kubectl context to ${SUPERVISOR_CLUSTER_IP}
o	kubectl vsphere login --server https://${SUPERVISOR_CLUSTER_IP} --insecure-skip-tls-verify  -u ${SUPERVISOR_CLUSTER_USER}
o	kubectl config use-context ${SUPERVISOR_CLUSTER_IP}
-	Login to vSphere-namespace 
o	kubectl vsphere login --server https://${SUPERVISOR_CLUSTER_IP} --insecure-skip-tls-verify  -u ${VS_NS_USER}
o	kubectl config use-context ${VS_NAMESPACE}
-	Create TKC Cluster
o	kubectl vsphere login --server https://${SUPERVISOR_CLUSTER_IP} --insecure-skip-tls-verify  -u ${VS_NS_USER}
o	kubectl apply -f create-tkc.yaml
o	in the vCenterUI: create a Devops user (ex: devops01@vsphere.local) and add to the ${VS_NAMESPACE} with edit permissions
o	Once the Cluster creation successful - Create Clusterwide role for this devopsuser
	kubectl vsphere login --server https://${SUPERVISOR_CLUSTER_IP} --insecure-skip-tls-verify  -u ${VS_NS_USER} --tanzu-kubernetes-cluster-name ${TKC_CLUSTER_NAME}
	kubectl config use-context ${TKC_CLUSTER_NAME}
	kubectl apply -f create-devops-role.yaml

2.	Sample files for reference

All the wrapper scripts, sample files and commands I used can be found in my git repo  folder - https://github.com/atozprasad/cna/tree/master/tkg-service/vSphere7u3/cli-vm
-	Git Repo  : https://github.com/atozprasad/cna
-	Folders 
o	Supervisor Cluster level -  https://github.com/atozprasad/cna/tree/master/tkg-service/vSphere7u3/cli-vm
o	vSphere-Name-Space level - https://github.com/atozprasad/cna/tree/master/tkg-service/vSphere7u3/cli-vm/vns 
o	TKC-Cluster level  - https://github.com/atozprasad/cna/tree/master/tkg-service/vSphere7u3/cli-vm/vns/tkc-finance-clu-01 

3.	JUMP host
a.	Ubuntu VM
b.	Install docker
c.	Install kubectl 
d.	Install figlet ( if you want to use my wraper scripts) 
e.	Install kubectl vsphere 
i.	< on your browser go to the ip address of supervisor cluster >
ii.	Download the kubectl vsphere plugin (zip file)
iii.	Copy them to the /usr/local/bin ( it should be in the same folder where kubectl binary located)
4.	Documentation Reference from VMWare

•  Supervisor Cluste
	Configuration Management - https://docs.vmware.com/en/VMware-vSphere/7.0/vmware-vsphere-with-tanzu/GUID-21ABC792-0A23-40EF-8D37-0367B483585E.html
	Provisioning Supervisor Cluster - https://docs.vmware.com/en/VMware-vSphere/7.0/vmware-vsphere-with-tanzu/GUID-31BF8166-5FC8-4D43-933D-5797F3BE4A36.html
•  TKC
	Provisioning TKC - https://docs.vmware.com/en/VMware-vSphere/7.0/vmware-vsphere-with-tanzu/GUID-3040E41B-8A54-4D23-8796-A123E7CAE3BA.html
	Create Rolebinding for the sso:vsphere-user for TKC https://docs.vmware.com/en/VMware-vSphere/7.0/vmware-vsphere-with-tanzu/GUID-6DE4016E-D51C-4E9B-9F8B-F6577A18F296.html
	Monitoring TKC Cluster creation - https://docs.vmware.com/en/VMware-vSphere/7.0/vmware-vsphere-with-tanzu/GUID-DA1DF865-8FD7-4425-BABE-BEBAE4F27F56.html

P.S. Color code I used in the above document
Green – Supervisor cluster
Blue -  vSphere Name Space Level
Orange – Devops/k8s Cluster Level

