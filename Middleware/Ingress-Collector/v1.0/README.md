# v1.0

```shell
kubectl apply -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/controller-v1.0.0/deploy/static/provider/cloud/deploy.yaml
```

## 修改image repo：

`k8s.gcr.io/ingress-nginx/controller:v1.0.0@sha256:0851b34f69f69352bf168e6ccf30e1e20714a264ab1ecd1933e4d8c0fc3215c6`
`k8s.gcr.io/ingress-nginx/kube-webhook-certgen:v1.0@sha256:f3b6b39a6062328c095337b4cadcefd1612348fdd5190b1dcbcb9b9e90bd8068`
依次更换为
`anjia0532/google-containers.ingress-nginx.controller:v1.0.0`
`anjia0532/google-containers.ingress-nginx.kube-webhook-certgen:v1.0`

## test

```shell
curl --resolve nginx-test.paynewu.com:80:127.0.0.1 http://nginx-test.paynewu.com
curl --resolve tomcat-test.paynewu.com:8080:127.0.0.1 http://tomcat-test.paynewu.com
```