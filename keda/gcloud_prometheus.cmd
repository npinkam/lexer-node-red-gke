rem Enable metrics and create Prometheus and Grafana &
kubectl apply --kustomize github.com/kubernetes/ingress-nginx/deploy/prometheus/ &
helm upgrade ingress-controller ingress-nginx/ingress-nginx ^
  --namespace ingress-nginx ^
  --set controller.metrics.enabled=true ^
  --set-string controller.podAnnotations."prometheus\.io/scrape"="true" ^
  --set-string controller.podAnnotations."prometheus\.io/port"="10254" &
kubectl apply --kustomize github.com/kubernetes/ingress-nginx/deploy/grafana/ &
