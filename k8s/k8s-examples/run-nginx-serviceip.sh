#!/bin/bash
kubectl create deployment --image nginx my-nginx
kubectl expose deployment my-nginx --port=80 --type=LoadBalancer

