# Install GFS(glusterfs)

## part 1, Install glusterfs software tools
> all node

```shell
yum install -y glusterfs glusterfs-fuse 
```

## Part 2, Tagging node

```shell
# show node label
kubectl get node --show-labels

# mark it
kubectl label nodes NODE_NAME_1 storagenode=glusterfs
kubectl label nodes NODE_NAME_2 storagenode=glusterfs
kubectl label nodes NODE_NAME_3 storagenode=glusterfs

# more...
```

## Part 3,deploy daemon_set gluster

```shell
# domestic
kubectl apply -f https://gitee.com/environment-creator/kubernetes-deployment/raw/main/GlusterFS/daemonset.yaml
# foreign
kubectl apply -f https://raw.githubusercontent.com/KubernetersDeployExample/script/main/GlusterFS/daemonset.yaml

```

## Part 4,deploy heketi

```shell
# domestic
kubectl apply -f https://gitee.com/environment-creator/kubernetes-deployment/raw/main/GlusterFS/heketi.yaml
# foreign
kubectl apply -f https://raw.githubusercontent.com/KubernetersDeployExample/script/main/GlusterFS/heketi.yaml
```