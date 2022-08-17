#!/bin/bash
figlet "Cluster Info"
kubectl cluster-info
read -p "Next ..."

figlet "API Resources"
kubectl api-resources -o wide
read -p "Next ..."
