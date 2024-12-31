#!/bin/bash

kubectl delete all --all -n jellyfin
kubectl delete all --all -n ingress-nginx

kubectl delete namespace jellyfin
kubectl delete namespace ingress-nginx

kubectl delete pv jellyfin-config-pv jellyfin-users-pv jellyfin-media-pv

kubectl delete ipaddresspool ingress-nginx-pool -n metallb-system
kubectl delete l2advertisement ingress-nginx-l2 -n metallb-system

kubectl delete namespace metallb-system

minikube delete

minikube start --mount-string="/home/vova/jellyfin:/home/vova/jellyfin" --mount

jelly_local(){
	kubectl apply -f jelly_pvc.yaml
}

jelly_public(){
	kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/main/config/manifests/metallb-native.yaml
	
	sleep 60
	
	kubectl apply -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/main/deploy/static/provider/cloud/deploy.yaml

	
	sleep 120

	kubectl apply -f jelly_pvc_nginx.yaml
}

# jelly_public

# jelly_local


