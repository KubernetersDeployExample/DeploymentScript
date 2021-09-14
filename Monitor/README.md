# monitor

> Based on  node-export、 prometheus、 grafana

If you want, adding a dashboard is a very good choice

## Deployment

### Scheme I

Download this item

```shell
cd script 
kubectl apply -f monitor
```

### Scheme II

Deploy separately with remote files

```shell
kubectl apply -f https://raw.githubusercontent.com/KubernetersDeployExample/script/main/monitor/node-exporter.yaml
kubectl apply -f https://raw.githubusercontent.com/KubernetersDeployExample/script/main/monitor/prometheus.yaml
kubectl apply -f https://raw.githubusercontent.com/KubernetersDeployExample/script/main/monitor/grafana.yaml
```

## Helm

> repo: https://apphub.aliyuncs.com/

```shell
helm repo add aliyun  https://apphub.aliyuncs.com/ && helm repo update 
helm install (deploy Name) aliyun/prometheus-operator  [-n namespace]
```

default user：admin Default passwd

```shell
kubectl get secrets [-n namespace] (deploy Name)-grafana -o yaml |  head -3 | grep \
      "admin-password" | awk '{print $2}' | base64 -d | awk '{print $1}'
```

