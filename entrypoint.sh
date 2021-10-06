#!/bin/sh

set -e

mkdir $HOME/.kube
echo ${KUBE_CONFIG_DATA}
printf ${KUBE_CONFIG_DATA} | base64 -d > $HOME/.kube/config
chmod go-r ~/.kube/config
export KUBECONFIG="${HOME}/.kube/config"


echo "running entrypoint command(s)"

response=$(sh -c " $*")

echo "::set-output name=response::$response"
