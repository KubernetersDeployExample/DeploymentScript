# Kubernetes Dashboard Deployment

## Deployment Kubernetes Dashboard from yaml

### Deployment

```shell
# deployment 
kubectl apply -f https://raw.githubusercontent.com/kubernetes/dashboard/v2.2.0/aio/deploy/recommended.yaml
# create service account
kubectl create serviceaccount payne --namespace kubernetes-dashboard
# kubectl cluster role binding
kubectl create clusterrolebinding payne --clusterrole=cluster-admin --serviceaccount=kubernetes-dashboard:kubernetes-dashboard
# get payne secrets token
kubectl get secrets -n kubernetes-dashboard | grep payne | awk '{print $1}' | xargs kubectl -n kubernetes-dashboard describe secrets | grep "token:" | awk '{print $2}'
```

### expose port

#### NodePort

```yaml
kubectl get svc -n kubernetes-dashboard kubernetes-dashboard -o yaml | sed 's/\ClusterIP/NodePort/g' | kubectl apply -f
  result=$(kubectl get svc -n kubernetes-dashboard | grep kubernetes-dashboard | awk '{print $5}')
echo "Test IP: https://0.0.0.0:${result:4:5}"
```

#### Ingress

> ingress must be deployed first

```shell
openssl req -x509 -sha256 -nodes -days 365 -newkey rsa:2048 -keyout tls.key -out tls.crt -subj "/C=CN/ST=CS/L=CS/O=Dashboard/CN=kubernetes-dashboard/O=kubernetes-dashboard"
kubectl create secret tls kubernetes-dashboard-certs --namespace kubernetes-dashboard --key=tls.key --cert=tls.crt 
```

**Configure the created certificate into kubernetes dashboard**

```shell
kubectl edit deployments kubernetes-dashboard -n kubernetes-dashboard	
containers:
- args:
	- --tls-cert-file=/tls.crt
	- --tls-key-file=/tls.key                                                                                                                                                                               .key
```

## Deployment Kubernetes Dashboard from helm

## Reference

[URL](https://raw.githubusercontent.com/kubernetes/dashboard/v2.2.0/aio/deploy/recommended.yaml) :https://raw.githubusercontent.com/kubernetes/dashboard/v2.2.0/aio/deploy/recommended.yaml

