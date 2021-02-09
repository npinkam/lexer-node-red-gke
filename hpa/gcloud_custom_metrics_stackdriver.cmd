rem Enable metrics and create a sidecar to push matrics to Stackdriver
rem validate value by: helm get values ingress-controller --namespace ingress-nginx
helm upgrade -f .\hpa\ingress-nginx-sidecar.yaml ingress-controller ingress-nginx/ingress-nginx ^
  --namespace ingress-nginx &
kubectl apply -f https://raw.githubusercontent.com/GoogleCloudPlatform/k8s-stackdriver/master/custom-metrics-stackdriver-adapter/deploy/production/adapter.yaml &
kubectl apply -f .\hpa\hpa.yaml &
