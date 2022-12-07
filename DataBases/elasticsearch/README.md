elasticsearch
===

```bash
helm install \
  --set master.replicaCount=3,data.shards=5,coordinating.replicaCount=3 \
  -n storage --create-namespace \
  --generate-name bitnami/elasticsearch

```