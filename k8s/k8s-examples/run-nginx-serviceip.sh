#!/bin/bash
kubectl create deployment --image nginx my-nginx-4lb
kubectl expose deployment my-nginx-4lb --port=80 --type=LoadBalancer

