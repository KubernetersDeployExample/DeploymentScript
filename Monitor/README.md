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
helm repo add aliyuncs  https://apphub.aliyuncs.com/ && helm repo update 
# helm install (deploy Name) aliyuncs/prometheus-operator  [-n namespace]
helm install prometheus-operator -n monitor --create-namespace aliyuncs/prometheus-operator
```

default user：admin
Default passwd: prom-operator
```bash
kubectl get secret -n monitor -o jsonpath="{.items[3].data.admin-password}" | base64 --decode
```
