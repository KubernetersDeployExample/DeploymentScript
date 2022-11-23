elasticsearch
===

```bash
helm install -n storage --set master.replicaCount=3,data.shards=5,coordinating.replicaCount=3 -g bitnami/elasticsearch
```