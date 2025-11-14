#!/usr/bin/env bash

source $(dirname ${BASH_SOURCE[0]})/setenv.sh

check_helm

helm repo add arktec-quant-helm-charts https://charts.arktecquant.com
helm repo update
helm install --kubeconfig ${KUBE_CONFIG} --namespace ${NAMESPACE} --create-namespace -f ${values_yaml} \
  ${ARGS[*]} \
  ${PROJECT_NAME} \
  arktec-quant-helm-charts/vllm \
  --version ${HELM_version}
