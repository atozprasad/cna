#!/bin/bash

cat > namespace.yaml <<EOF
apiVersion: v1
kind: Namespace
metadata:
  name: vmware-system-csi
EOF

echo -e "\n Creating namespace vmware-system-csi"
kubectl apply -f namespace.yaml 

