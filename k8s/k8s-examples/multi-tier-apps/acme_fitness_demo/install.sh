#!/bin/bash
oc apply -f ./kubernetes-manifests/
#oc adm policy add-scc-to-user scc-admin -z default
oc adm policy add-scc-to-user anyuid -n acme-fitness -z default
