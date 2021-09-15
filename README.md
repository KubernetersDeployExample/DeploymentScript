# Kubernetes Deploy Example


```shell
Client Version{
  Major:"1", Minor:"19", 
  GitVersion:"v1.19.8", GitCommit:"fd5d41537aee486160ad9b5356a9d82363273721",
  GitTreeState:"clean", BuildDate:"2021-02-17T12:41:51Z", 
  GoVersion:"go1.15.8", Compiler:"gc", 
  Platform:"linux/amd64"
}

server Verison: {
  Major:"1", Minor:"19", 
  GitVersion:"v1.19.14", GitCommit:"0fd2b5afdfe3134d6e1531365fdb37dd11f54d1c", 
  GitTreeState:"clean", BuildDate:"2021-08-11T18:02:17Z", 
  GoVersion:"go1.15.15", Compiler:"gc", Platform:"linux/amd64"
}

helm Version{
  "Version":  "v3.5.2", 
  "GitTreeState": "dirty", 
  "GoVersion":  "go1.15.7"
}
```

> **`Client Version`**: version.Info{Major:"1", Minor:"19", GitVersion:"v1.19.8", 
>GitCommit:"fd5d41537aee486160ad9b5356a9d82363273721",
> GitTreeState:"clean", BuildDate:"2021-02-17T12:41:51Z", 
> GoVersion:"go1.15.8", Compiler:"gc", Platform:"linux/amd64"}

> **`Server Version`**: version.Info{Major:"1", Minor:"19", GitVersion:"v1.19.14", GitCommit:"0fd2b5afdfe3134d6e1531365fdb37dd11f54d1c", GitTreeState:"clean", BuildDate:"2021-08-11T18:02:17Z", GoVersion:"go1.15.15", Compiler:"gc", Platform:"linux/amd64"}

- Monitor
    - [x] dashboard
    - [x] node-exporter
    - [x] prometheus
    - [x] grafana

- CrawlerUntil
  - [x] splash

- Middleware
  - [x] kafka


more...

## repo
github: https://github.com/KubernetersDeployExample/script
gitee: https://gitee.com/environment-creator/kubernetes-deployment