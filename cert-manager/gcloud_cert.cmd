kubectl apply -f https://raw.githubusercontent.com/jetstack/cert-manager/release-0.8/deploy/manifests/00-crds.yaml
kubectl label namespace kube-system certmanager.k8s.io/disable-validation="true"
helm repo add jetstack https://charts.jetstack.io
helm repo update
helm install cert-manager --namespace kube-system jetstack/cert-manager
kubectl create -f cert-manager/issuer.yaml
kubectl delete -f ingress.yaml
kubectl apply -f cert-manager/ingress-cert.yaml