# DNS Operator in Openshift 4.7
**Document reference : https://docs.openshift.com/container-platform/4.7/networking/dns-operator.html ***
- Use the oc get command to view the deployment status:
``` 
oc get -n openshift-dns-operator deployment/dns-operator
```

- Use the oc get command to view the state of the DNS Operator:
``` 
oc get clusteroperator/dns
```
## Vie default DNS

- Use the oc describe command to view the default dns:
``` 
oc describe dns.operator/default
```

- To find the service CIDR of your cluster, use the oc get command:
``` 
oc get networks.config/cluster -o jsonpath='{$.status.serviceNetwork}'
```


#DNS Operator Status


- View the status of the DNS Operator:
```
 oc describe clusteroperators/dns
```

- View the logs of the DNS Operator: 
```
 oc logs -n openshift-dns-operator deployment/dns-operator -c dns-operator
```
