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