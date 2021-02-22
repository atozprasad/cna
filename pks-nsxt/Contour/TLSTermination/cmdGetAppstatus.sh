#!/bin/bash
kubectl get po,deployment,svc,httpproxy,ing -l app=$1

