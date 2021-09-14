# Kubernetes Dashboard
> Deployment Kubernetes Dashboard from yaml

## Deployment 

```shell
# domestic
kubectl apply -f https://gitee.com/environment-creator/kubernetes-deployment/raw/main/Monitor/dashboard/deployment.yaml
# foreign
kubectl apply -f https://raw.githubusercontent.com/KubernetersDeployExample/script/main/Monitor/dashboard/deployment.yaml
```

## Authentication
> Can't access normally when use default yaml，Because there is no permission
> We should grant the default user `kubernetes-dashboard` or create a user related permissions


### create user payne

```yaml
apiVersion: v1
kind: ServiceAccount
metadata:
  name: payne
  namespace: monitor
```

## grant Authority
> Of course you can also directly grant Authority to default user kubernetes-dashboard, 
> Just replace the `payne` below with `kubernetes-dashboard` 

```yaml
apiVersion: rbac.authorization.k8s.io/v1
kind: ClusterRoleBinding
metadata:
  name: payne
roleRef:
  apiGroup: rbac.authorization.k8s.io
  kind: ClusterRole
  name: cluster-admin
subjects:
- kind: ServiceAccount
  name: payne
  namespace: monitor
```

grant Authority from command 
```shell
kubectl create clusterrolebinding kubernetes-dashboard --clusterrole=cluster-admin --serviceaccount=monitor:kubernetes-dashboard
```



## Reference
[URL](https://raw.githubusercontent.com/kubernetes/dashboard/v2.2.0/aio/deploy/recommended.yaml) :https://raw.githubusercontent.com/kubernetes/dashboard/v2.2.0/aio/deploy/recommended.yaml

