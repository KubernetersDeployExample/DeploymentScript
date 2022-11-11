#!/usr/bin/env sh
kubectl apply -f zookeeper.yaml && kubectl apply -f kafka-svc.yaml
cat kafka.yaml | sed \
  "s/@kafka_service_clusterIp/$(kubectl get svc kafka-service -n middleware | grep \
    NodePort | awk '{print $3}')/g" | sed \
  "s/@zookeeper_service_clusterIp/$(kubectl get svc zookeeper-service -n middleware | grep \
    ClusterIP | awk '{print $3}')/g" | kubectl apply -f -
