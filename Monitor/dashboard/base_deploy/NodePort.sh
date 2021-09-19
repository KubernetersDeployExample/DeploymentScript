#!/usr/bin/env sh
kubectl get svc -n kubernetes-dashboard kubernetes-dashboard \
    -o yaml | sed 's/\ClusterIP/NodePort/g' | kubectl apply -f -
  result=$(kubectl get svc -n kubernetes-dashboard | grep kubernetes-dashboard | awk '{print $5}')
echo "Test IP: https://0.0.0.0:${result:4:5}"