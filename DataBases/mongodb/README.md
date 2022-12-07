mongodb
===

Rapid deployment of mongodb-sharded based on helm

## mongo

```bash
helm install \
  -n storage --create-namespace \
  --generate-name bitnami/mongodb-sharded

```

## mongodb-shard

```bash
helm install \
  --set shards=7 \
  -n storage --create-namespace \
  --generate-name bitnami/mongodb-sharded
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