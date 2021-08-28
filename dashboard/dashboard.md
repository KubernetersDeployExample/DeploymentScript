# Kubernetes Dashboard
> Deployment Kubernetes Dashboard


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