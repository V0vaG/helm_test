kubectl create secret docker-registry regcred \
  --docker-server=192.168.68.64:5000 \
  --docker-username=admin \
  --docker-password=Admin123 \
  --docker-email=none@none \
  -n argocd
