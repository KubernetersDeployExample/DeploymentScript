# deployment dashboard

## create Certificate
openssl req -x509 -sha256 -nodes -days 365 -newkey rsa:2048 -keyout tls.key -out tls.crt -subj "/CN=kubernetes-dashboard/O=kubernetes-dashboard"
kubectl create secret tls kubernetes-dashboard-certs --key=tls.key --cert=tls.crt

## add kubernetes-dashboard repo of helm
helm repo add kubernetes-dashboard https://kubernetes.github.io/dashboard/ && helm repo update

## Custom values.yalm

cat > values.yaml << EOF
ingress:
  enabled: true
  annotations:
    kubernetes.io/ingress.class: "nginx"
    nginx.ingress.kubernetes.io/ssl-redirect: "true"
    nginx.ingress.kubernetes.io/rewrite-target: /
  hosts:
    - dashboard.paynewu.com
  tls:
    - secretName: kubernetes-dashboard-certs
      hosts:
        - dashboard.paynewu.com
metricsScraper:
  enabled: true
metrics-server:
  enabled: true
EOF


helm install kubernetes-dashboard kubernetes-dashboard/kubernetes-dashboard -n monitor -f values.yaml
