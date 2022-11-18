sharded
===

Rapid deployment of mongodb-sharded based on helm

```bash
helm install -n storage --set shards=7 --generate-name bitnami/mongodb-sharded
```

## Online sample files

```yaml
shards: 4

volumePermissions:
  enabled: true

service:
  type: LoadBalancer

configsvr:
  replicas: 3

shardsvr:
  dataNode:
    replicas: 2
  arbiter:
    replicas: 1

metrics:
  enabled: true
```