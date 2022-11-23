# based on nfs Deployment Redis

## deploy NFS

```shell
# create local pv folder
mkdir -p /data/share/nfs/redis/pv{1..6}

cat > /etc/exports << EOF
/data/share/nfs/redis/pv1 *(rw,no_root_squash,no_all_squash,sync)
/data/share/nfs/redis/pv2 *(rw,no_root_squash,no_all_squash,sync)
/data/share/nfs/redis/pv3 *(rw,no_root_squash,no_all_squash,sync)
/data/share/nfs/redis/pv4 *(rw,no_root_squash,no_all_squash,sync)
/data/share/nfs/redis/pv5 *(rw,no_root_squash,no_all_squash,sync)
/data/share/nfs/redis/pv6 *(rw,no_root_squash,no_all_squash,sync)
EOF

exportfs -r

systemctl restart rpcbind && systemctl restart nfs && systemctl status rpcbind && systemctl status nfs
```

cat pv.yaml | sed 's/\${NFS_IP}/192.168.0.27/g' | sed 's/\${PV_PATH}/\/data\/nfs\/redis/g' | kubectl
apply -f -

## helm

```bash
# single redis
helm install -n storage --generate-name bitnami/redis
# redis cluster
helm install -n storage --set cluster.nodes=9,cluster.replicas=2 --generate-name  bitnami/redis-cluster
```