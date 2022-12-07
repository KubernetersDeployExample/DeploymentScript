kong
===

- [kong docs](https://docs.konghq.com/)
- [helm repo](https://charts.konghq.com)

```bash
helm install \
  --set ingressController.installCRDs=false \
  -n kong --create-namespace \
  --generate-name kong/kong 
```