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
kubectl apply -f https://gitee.com/kubernetes-deployment/ExampleScript/raw/main/GlusterFS/DaemonSet.yaml
# foreign
kubectl apply -f https://raw.githubusercontent.com/KubernetersDeployExample/script/main/GlusterFS/DaemonSet.yaml

```