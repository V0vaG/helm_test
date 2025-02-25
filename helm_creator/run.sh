#!/bin/bash

app='vhub'
port='30087'

# k3s kubectl delete -f ${app}.yaml

cp manifest_template.yaml ${app}.yaml

sed -i "s/APP/${app}/g" ${app}.yaml

sed -i "s/PORT/${port}/g" ${app}.yaml

# k3s kubectl apply -f ${app}.yaml

cat ${app}.yaml | helmify ${app}
