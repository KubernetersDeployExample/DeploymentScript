# install 
> all node

```shell
yum install -y glusterfs glusterfs-fuse 
```

## Tagging node

```shell
# show node lable
kubectl get node --show-labels

# mark it
kubectl label nodes NODE_NAME storagenode=glusterfs
```

```shell
# domestic
kubectl apply -f https://gitee.com/environment-creator/kubernetes-deployment/raw/main/GlusterFS/daemonSet.yaml
# foreign
kubectl apply -f http://raw.githubusercontent.com/KubernetersDeployExample/script/main/GlusterFS/daemonset.yaml

```

https://gitee.com/environment-creator/kubernetes-deployment/raw/main/GlusterFS/heketi-rbac.yaml