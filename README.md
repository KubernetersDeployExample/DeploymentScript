# Kubernetes Deploy Example

helm Version
```json
{
	Version:"v3.5.2", 
	GitTreeState:"dirty", 
	GoVersion:"go1.15.7"
}
```

- Monitor
    - [x] dashboard
    - [x] node-exporter
    - [x] prometheus
    - [x] grafana

- CrawlerUntil
  - [x] splash

- Middleware
  - [x] kafka


more...

## repo
github: https://github.com/KubernetersDeployExample/script
gitee: https://gitee.com/environment-creator/kubernetes-deployment


openssl req -x509 -sha256 -nodes -days 365 -newkey rsa:2048 -keyout tls.key -out tls.crt -subj "/CN=kubernetes-dashboard/O=kubernetes-dashboard"
kubectl create secret tls kubernetes-dashboard-certs --key=tls.key --cert=tls.crt
kubectl edit deployments kubernetes-dashboard -n kubernetes-dashboard	

kubectl create secret tls tls-secret --key tls.key --cert tls.crt
kubectl create secret tls kubernetes-dashboard-certs --key tls.key --cert tls.crt
kubectl create secret tls kubernetes-dashboard-certs --key=XXX.key --cert=XXX.pem(或者是xxx.crt)

