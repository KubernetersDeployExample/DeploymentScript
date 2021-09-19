#!/usr/bin/env sh

# Grant permissions
kubectl create clusterrolebinding kubernetes-dashboard --clusterrole=cluster-admin \
  --serviceaccount=kubernetes-dashboard:kubernetes-dashboard
# get secrets token
kubectl get secrets -n kubernetes-dashboard | grep kubernetes-dashboard | awk '{print $1}' | xargs kubectl \
    -n kubernetes-dashboard describe secrets | grep "token:" | awk '{print $2}'