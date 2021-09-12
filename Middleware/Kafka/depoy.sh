#!/usr/bin/env sh
kafkaSVC_clusterIp=$(kubectl get svc kafka-service -n middleware | grep NodePort | awk '{print $3}')
echo -e "kafka_service_clusterIp \t ${kafkaSVC_clusterIp}"

zookeeperSVC_clusterIp=$(kubectl get svc zookeeper-service -n middleware | grep ClusterIP | awk '{print $3}')
echo -e "zookeeper_service_clusterIp \t ${zookeeperSVC_clusterIp}"

kubectl apply -f zookeeper.yaml && kubectl apply -f kafka-svc.yaml
#cat kafka.yaml | sed "s/@kafka_service_clusterIp/${kafkaSVC_clusterIp}/g" | sed "s/@zookeeper_service_clusterIp/${zookeeperSVC_clusterIp}/g" | kubectl apply -f -
cat kafka.yaml | sed "s/@kafka_service_clusterIp/${kafkaSVC_clusterIp}/g" | sed "s/@zookeeper_service_clusterIp/${zookeeperSVC_clusterIp}/g"