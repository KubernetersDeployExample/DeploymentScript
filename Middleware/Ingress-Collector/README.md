## HTTP

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

## HTTPS

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

# https://kubernetes.github.io/ingress-nginx/user-guide/nginx-configuration/annotations/

```bash
helm upgrade --install ingress-nginx ingress-nginx \
  --repo https://kubernetes.github.io/ingress-nginx \
  --namespace ingress-nginx --create-namespace
```


website: https://kubernetes.github.io/ingress-nginx/deploy/