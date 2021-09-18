# Ingress

## 下载 ingress-nginx

```bash
wget -c https://raw.githubusercontent.com/kubernetes/ingress-nginx/nginx-0.30.0/deploy/static/provider/baremetal/service-nodeport.yaml -P plan
wget -c https://raw.githubusercontent.com/kubernetes/ingress-nginx/nginx-0.30.0/deploy/static/mandatory.yaml
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

`image: quay.io/kubernetes-ingress-controller/nginx-ingress-controller:0.30.0`,替换为
`registry.cn-beijing.aliyuncs.com/google_registry/nginx-ingress-controller:0.30.0`


### 推荐的ingress

```shell
kubectl apply -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/controller-v1.0.0/deploy/static/provider/cloud/deploy.yaml
```

## 书写ingress

### HTTP

```yaml
apiVersion: networking.k8s.io/v1
kind: Ingress
metadata:
  name: ingress-http
  namespace: dev
  labels:
    name: dev
spec:
  rules:
    - host: nginx-test.paynewu.com
      http:
        paths:
          - pathType: Prefix
            path: "/"
            backend:
              service:
                name: nginx-service
                port:
                  number: 80
    - host: tomcat-test.paynewu.com
      http:
        paths:
          - pathType: Prefix
            path: "/"
            backend:
              service:
                name: tomcat-service
                port:
                  number: 8080
```

### HTTPS

> 签名证书(测试环境使用，开发环境请选择对于云厂商购买)
> openssl req -x509 -sha256 -nodes -days 365 -newkey rsa:2048 -keyout tls.key -out tls.crt -subj "/C=CN/ST=CS/L=CS/O=Dashboard/CN=kubernetes-dashboard/O=kubernetes-dashboard"
> kubectl create secret tls kubernetes-dashboard --key=tls.key --cert=tls.crt

```yaml
apiVersion: networking.k8s.io/v1
kind: Ingress
metadata:
  name: ingress-http
  namespace: dev
  labels:
    name: dev
spec:
  tls:
    - secretName: tls-src # 密钥名字
    - hosts:
        - nginx-test.paynewu.com  # 对应的网站
        - tomcat-test.paynewu.com
  rules:
    - host: nginx-test.paynewu.com
      http:
        paths:
          - pathType: Prefix
            path: "/"
            backend:
              service:
                name: nginx-service
                port:
                  number: 80
    - host: tomcat-test.paynewu.com
      http:
        paths:
          - pathType: Prefix
            path: "/"
            backend:
              service:
                name: tomcat-service
                port:
                  number: 8080

```