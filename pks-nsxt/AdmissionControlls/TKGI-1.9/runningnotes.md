# Sample commands to create K8S Admission Controllers in TKGI/PKS based environment
using Admission Controllers:
https://kubernetes.io/docs/reference/access-authn-authz/admission-controllers/

A Guide to Kubernetes Admission Controllers:
https://kubernetes.io/blog/2019/03/21/a-guide-to-kubernetes-admission-controllers/


K8s Admission Control recommendation
from the above link:
Kubernetes recommends the following admission controllers to be enabled by default.
--enable-admission-plugins=NamespaceLifecycle,LimitRanger,ServiceAccount,DefaultStorageClass,DefaultTolerationSeconds,MutatingAdmissionWebhook,ValidatingAdmissionWebhook,Priority,ResourceQuota,PodSecurityPolicy

PKS
=====
> ###  Step-1  Create PKS profile -- example
tkgi create-k8s-profile ./profile-api-server-ac-recommended.json
# Expected output : Kubernetes profile profile-kube-apiserver-ac-recommended successfully created

tkgi create-k8s-profile ./profile-api-server-ac-webhook.json
# Expected output : Kubernetes profile profile-api-server-ac-webhook.json successfully created


> ###  Step-2 Create K8S Cluster using PKS -- Example

CLUSTER_NAME="pks-cluster-1-with-k8s-profile"
EXTERNAL_HOST_NAME="pks-cluster-1-with-k8s-profile"
NETWORK_PROFILE="single-tier-profile"
K8S_PROFILE="profile-kube-apiserver-ac-recommended" # Profile name specified in the .json file at the first step, and the profile which already been created using PKS create-k8s-profile as showed in the step1. 

tkgi create-cluster ${CLUSTER_NAME} --external-hostname ${EXTERNAL_HOST_NAME} --plan large --num-nodes 1 --network-profile ${NETWORK_PROFILE} --kubernetes-profile ${K8S_PROFILE}


> ###  Step-3 Validate the cluster creation, for example  Use 'pks cluster <cluster-name>' to monitor the state of your cluster

tkgi cluster ${CLUSTER_NAME}

> ### Optional Step-4 Check for Bosh jobs -- example
master/81436521-b271-469b-8210-548862911fb9:/var/vcap/jobs/kube-apiserver/config# more bpm.yml 
