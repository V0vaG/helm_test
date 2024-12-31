mkdir /home/vova/jellyfin/data
mkdir /home/vova/jellyfin/config
mkdir /home/vova/jellyfin/users

minikube start --mount-string="/home/vova/jellyfin:/home/vova/jellyfin" --mount

kubectl apply -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/main/deploy/static/provider/cloud/deploy.yaml

kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/main/config/manifests/metallb-native.yaml

kubectl apply -f jelly_pvc.yaml
