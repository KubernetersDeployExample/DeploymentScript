#!/usr/bin/env sh
# Environment variable
appName="kubernetes-dashboard"
namespace="monitor"
Permission="admin"

kubectl get svc -n ${namespace} ${appName} -o yaml | sed 's/\ClusterIP/NodePort/g' | kubectl apply  -f -
result=$(kubectl get svc -n monitor | grep ${appName} | awk '{print $5}')
echo "Test IP: https://0.0.0.0:${result:4:5}"