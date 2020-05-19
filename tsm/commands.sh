 kubectl -n istio-system get cm istio -o jsonpath="{@.data.mesh}" | grep disablePolicyChecks
 kubectl get services -n istio-system | grep istio-ingressgateway

 kubectl get virtualservices
 kubectl get serviceentries
 kubectl edit serviceentry nsxsm.gns.acmegns.catalog
 istioctl authn tls-check shopping-687766b5c-nrndx catalog.acmegns.local
 istioctl authn tls-check shopping-687766b5c-nrndx


