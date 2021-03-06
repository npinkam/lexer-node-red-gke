gcloud container clusters delete node-app-vpc-nginx-prom --quiet &
gcloud container clusters create node-app-vpc-nginx-prom --enable-ip-alias --create-subnetwork="" ^
 --network=default --machine-type=e2-small --disk-size=40GB --release-channel=regular ^
 --num-nodes=1 --enable-autoscaling --min-nodes 1 --max-nodes 2 --quiet &
rem gcloud container clusters create node-app-vpc-nginx-prom --enable-ip-alias --create-subnetwork="" ^
rem   --network=default --num-nodes=1 --enable-autoscaling --min-nodes 1 --max-nodes 6 --quiet &
gcloud compute disks delete nfs-disk --quiet &
gcloud compute disks create --size=10GB --zone=asia-northeast1-a nfs-disk --quiet &
kubectl create clusterrolebinding cluster-admin-binding --clusterrole cluster-admin --user hamije.retsu@gmail.com &
kubectl create namespace ingress-nginx &
helm repo add ingress-nginx https://kubernetes.github.io/ingress-nginx &
helm repo update &
helm install ingress-controller ingress-nginx/ingress-nginx --namespace ingress-nginx &
rem Create firewall rule tcp:8443 and tcp:10254 if nescessary
cd C:\Users\Nantawat Pinkam\Dropbox\Kubernates\node-app-298105\node-red-session-affinity-nginx &
kubectl apply -f .\service.yaml -f .\nfs-server-deployment.yaml -f .\nfs-clusterip-service.yaml -f .\nfs-pv-pvc.yaml -f .\deployment.yaml -f .\ingress.yaml&
