kubectl config use-context tkswlc9-admin@tkswlc9
#git clone https://github.com/vmwarecloudadvocacy/acme_fitness_demo -b dkalani-dev3
sed -i 's/catalog\.acme\.com/catalog\.acmegns\.local/g' acme_fitness_demo/kubernetes-manifests/acme_fitness_cluster1.yaml
kubectl label ns default istio-injection=enabled
kubectl apply -f acme_fitness_demo/kubernetes-manifests/secrets.yaml
kubectl apply -f acme_fitness_demo/istio-manifests/gateway.yaml
kubectl apply -f acme_fitness_demo/kubernetes-manifests/acme_fitness_cluster2.yaml
