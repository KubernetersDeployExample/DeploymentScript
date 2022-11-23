Click House
===

## Helm

```bash
helm install -n storage --set replicaCount=3,shards=3,zookeeper.replicaCount=3 -g bitnami/clickhouse
```