Click House
===

## Helm

```bash
helm install \
  --set replicaCount=3,shards=3,zookeeper.replicaCount=3 \
  -n storage --create-namespace \
  --generate-name bitnami/clickhouse

```