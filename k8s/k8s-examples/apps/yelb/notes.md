# Steps for running privillaged containers

- **Step 1 : Create Secuirity Context**
oc aapply -f SecurityContextConstraints.yaml
- **Step 2 : Assign the security context to user**
oc adm policy add-scc-to-user scc-admin -z admin
