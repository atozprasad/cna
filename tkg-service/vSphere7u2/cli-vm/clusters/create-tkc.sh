#!/bin/bash
source tkc-environment.sh
rm -f create-tkc.yaml temp.yaml
( echo "cat <<EOF >create-tkc.yaml";
  cat create-tkc.yaml.template;
  echo "EOF";
) >temp.yaml
. temp.yaml
cat create-tkc.yaml
exit
kubectl apply -f create-tkc.yaml
