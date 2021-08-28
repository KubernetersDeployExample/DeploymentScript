# Kubernetes Dashboard
> Deployment Kubernetes Dashboard


## Deployment 

```shell
# deployment
kubectl apply -f https://raw.githubusercontent.com/KubernetersDeployExample/script/main/dashboard/dashboard.yaml
# delete
kubectl delete -f https://raw.githubusercontent.com/KubernetersDeployExample/script/main/dashboard/dashboard.yaml
kubectl apply names
```

## Modify
> Custom modification details


```diff
kind: Service
apiVersion: v1
metadata:
  labels:
    k8s-app: kubernetes-dashboard
  name: kubernetes-dashboard
  namespace: kubernetes-dashboard
spec:
- type: NodePort
+ type: NodePort
  ports:
    - port: 443
      targetPort: 8443
+     nodePort: 32388
  selector:
    k8s-app: kubernetes-dashboard
```

## Reference
[URL](https://raw.githubusercontent.com/kubernetes/dashboard/v2.2.0/aio/deploy/recommended.yaml) :https://raw.githubusercontent.com/kubernetes/dashboard/v2.2.0/aio/deploy/recommended.yaml