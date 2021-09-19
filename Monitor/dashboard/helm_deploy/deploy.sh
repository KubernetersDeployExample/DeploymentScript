#!/usr/bin/env sh
# deployment kubernetes-dashboard

# Environment variable
appName="kubernetes-dashboard"
namespace="monitor"
Permission="admin"

# init
helm repo add ${appName} https://kubernetes.github.io/dashboard/ && \
     helm repo update

# install
kubectl create ns ${namespace}
helm install ${appName} kubernetes-dashboard/kubernetes-dashboard -n ${namespace}

# Grant Authority
kubectl create clusterrolebinding ${appName} --clusterrole=${Permission} --serviceaccount=${namespace}:${appName}
## get token
kubectl get secret -n  monitor  | grep "${appName}" | awk '{print $1}'  | xargs \
      kubectl -n monitor describe secret | grep "token:" | awk '{print $2}'

