# KafKa
shell Script to quickly deploy Kafka

## requirement
images:
awesomepayne/zookeeper:v0.1
awesomepayne/kafka:v0.1
namespace: middleware

## deployment
```shell
sh deploy.sh
```

## test

**Connectivity test**
```shell
kubectl exec -it --namespace middleware $(kubectl get pod -n middleware | grep kafka | awk '{print $1}') /bin/sh -- sh /opt/kafka/bin/kafka-console-producer.sh --broker-list  $(kubectl get svc kafka-service -n middleware | grep NodePort | awk '{print $3}'):9092 --topic test
kubectl exec -it --namespace middleware $(kubectl get pod -n middleware | grep kafka | awk '{print $1}') /bin/sh -- sh /opt/kafka/bin/kafka-console-consumer.sh --bootstrap-server $(kubectl get svc kafka-service -n middleware | grep NodePort | awk '{print $3}'):9092 --topic test --from-beginning
```

**topic test**
```shell
kubectl exec -it --namespace middleware $(kubectl get pod -n middleware | grep kafka | awk '{print $1}') /bin/sh -- sh /opt/kafka/bin/kafka-topics.sh --list --zookeeper $(kubectl get svc zookeeper-service -n middleware | grep ClusterIP | awk '{print $3}'):2181
```

## delete
kubectl delete -f kafka.yaml && kubectl delete -f kafka-svc.yaml && kubectl delete -f zookeeper.yaml