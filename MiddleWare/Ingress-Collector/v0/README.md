# v0

## 下载 ingress-nginx

```bash
wget -c -P plan https://raw.githubusercontent.com/kubernetes/ingress-nginx/nginx-0.30.0/deploy/static/provider/baremetal/service-nodeport.yaml
wget -c -P plan https://raw.githubusercontent.com/kubernetes/ingress-nginx/nginx-0.30.0/deploy/static/mandatory.yaml 
```

## 修改image repo：

> 由于不可描述原因，国内无法获取`quay.io/kubernetes-ingress-controller/nginx-ingress-controller:0.30.0`

### 方法一：拉去镜像，替换。操作如下

```
docker pull registry.cn-beijing.aliyuncs.com/google_registry/nginx-ingress-controller:0.30.0
docker tag 89ccad40ce8e quay.io/kubernetes-ingress-controller/nginx-ingress-controller:0.30.0
docker rmi  registry.cn-beijing.aliyuncs.com/google_registry/nginx-ingress-controller:0.30.0
```

### 方法二：将`mandatory.yaml`中
image:
```diff
-quay.io/kubernetes-ingress-controller/nginx-ingress-controller:0.30.0
+registry.cn-beijing.aliyuncs.com/google_registry/nginx-ingress-controller:0.30.0
```



## referer

https://cr.console.aliyun.com/cn-hangzhou/instances/images

https://github.com/kubernetes/ingress-nginx