#!/bin/bash
source setup.env
istio-${VERSION}/samples/bookinfo/platform/kube/cleanup.sh
kubectl delete all,secrets,sa,configmaps,deployments,ingresses,clusterroles,clusterrolebindings,customresourcedefinitions --selector=app=kiali -n istio-system
kubectl delete namespace istio-system
