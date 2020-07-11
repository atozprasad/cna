kubectl get node -o name --selector='!node-role.kubernetes.io/master' | cut -f2 -d'/'

