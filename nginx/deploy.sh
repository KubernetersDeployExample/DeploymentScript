#!/usr/bin/env sh
# deploy nginx
kubectl create deployment nginx --image=nginx
# export
kubectl expose deployment nginx --port=80 --type=NodePort
