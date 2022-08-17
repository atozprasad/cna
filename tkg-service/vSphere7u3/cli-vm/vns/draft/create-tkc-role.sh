#!/bin/bash
source ns.env
rm -f create-devops-role.yaml temp.yaml
( echo "cat <<EOF >create-devops-role.yaml";
  cat create-devops-role.yaml.template;
  echo "EOF";
) >temp.yaml
. temp.yaml
cat create-devops-role.yaml
read -p "Press Enter to apply the yaml..."
kubectl apply -f create-devops-role.yaml
