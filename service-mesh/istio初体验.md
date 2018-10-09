# istio初体验

本教程依据[在k8s上搭建istio免费教程](https://www.katacoda.com/courses/istio/deploy-istio-on-kubernetes)，记录在初次使用istio的过程中遇到的问题和心得体会。


#### 先决条件，需要安装好一套k8s集群，通过下述命令来查看集群信息：

	$ kubectl cluster-info
	Kubernetes master is running at https://172.17.0.79:6443
	KubeDNS is running at https://172.17.0.79:6443/api/v1/namespaces/kube-system/services/kube-dns:dns/proxy

## 1.下载istioctl和istio文件夹

执行以下命令下载脚本并执行，并将istio安装所需的目录下载到本地当前目录下

	curl -L https://git.io/getLatestIstio | ISTIO_VERSION=1.0.0 sh -

上述脚本的内容如下：

	#!/bin/sh
	#
	# Early version of a downloader/installer for Istio
	#
	# This file will be fetched as: curl -L https://git.io/getLatestIstio | sh -
	# so it should be pure bourne shell, not bash (and not reference other scripts)
	#
	# The script fetches the latest Istio release candidate and untars it.
	# It's derived from ../downloadIstio.sh which is for stable releases but lets
	# users do curl -L https://git.io/getLatestIstio | ISTIO_VERSION=0.3.6 sh -
	# for instance to change the version fetched.

	# This is the latest release candidate (matches ../istio.VERSION after basic
	# sanity checks)

	OS="$(uname)"
	if [ "x${OS}" = "xDarwin" ] ; then
	  OSEXT="osx"
	else
	  # TODO we should check more/complain if not likely to work, etc...
	  OSEXT="linux"
	fi

	if [ "x${ISTIO_VERSION}" = "x" ] ; then
	  ISTIO_VERSION=$(curl -L -s https://api.github.com/repos/istio/istio/releases/latest | \
                  grep tag_name | sed "s/ *\"tag_name\": *\"\\(.*\\)\",*/\\1/")
	fi

	NAME="istio-$ISTIO_VERSION"
	URL="https://github.com/istio/istio/releases/download/${ISTIO_VERSION}/istio-${ISTIO_VERSION}-${OSEXT}.tar.gz"
	echo "Downloading $NAME from $URL ..."
	curl -L "$URL" | tar xz
	# TODO: change this so the version is in the tgz/directory name (users trying multiple versions)
	echo "Downloaded into $NAME:"
	ls "$NAME"
	BINDIR="$(cd "$NAME/bin" && pwd)"
	echo "Add $BINDIR to your path; e.g copy paste in your shell and/or ~/.profile:"
	echo "export PATH=\"\$PATH:$BINDIR\""

完毕之后将istioctl加入到环境变量，执行：

	export PATH="$PATH:/root/istio-1.0.0/bin"	
	$ echo $PATH
	/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/usr/local/go/bin:/root/go/bin:/root/istio-1.0.0/bin

此时可以执行istioctl相关的命令了，具体用法稍后再说。

当前目录中出现istio-1.0.0目录，其目录结构如下

	$ tree -d istio-1.0.0/
	istio-1.0.0/
	├── bin
	├── install
	│   ├── consul
	│   ├── gcp
	│   │   └── deployment_manager
	│   ├── kubernetes
	│   │   ├── addons
	│   │   ├── ansible
	│   │   │   └── istio
	│   │   │       ├── defaults
	│   │   │       ├── meta
	│   │   │       ├── tasks
	│   │   │       └── vars
	│   │   └── helm
	│   │       ├── istio
	│   │       │   ├── charts
	│   │       │   │   ├── certmanager
	│   │       │   │   │   └── templates
	│   │       │   │   ├── galley
	│   │       │   │   │   └── templates
	│   │       │   │   ├── gateways
	│   │       │   │   │   └── templates
	│   │       │   │   ├── grafana
	│   │       │   │   │   └── templates
	│   │       │   │   ├── ingress
	│   │       │   │   │   └── templates
	│   │       │   │   ├── kiali
	│   │       │   │   │   └── templates
	│   │       │   │   ├── mixer
	│   │       │   │   │   └── templates
	│   │       │   │   ├── pilot
	│   │       │   │   │   └── templates
	│   │       │   │   ├── prometheus
	│   │       │   │   │   └── templates
	│   │       │   │   ├── security
	│   │       │   │   │   └── templates
	│   │       │   │   ├── servicegraph
	│   │       │   │   │   └── templates
	│   │       │   │   ├── sidecarInjectorWebhook
	│   │       │   │   │   └── templates
	│   │       │   │   ├── telemetry-gateway
	│   │       │   │   │   └── templates
	│   │       │   │   └── tracing
	│   │       │   │       └── templates
	│   │       │   └── templates
	│   │       └── istio-remote
	│   │           ├── charts
	│   │           │   ├── security
	│   │           │   │   └── templates
	│   │           │   └── sidecarInjectorWebhook
	│   │           │       └── templates
	│   │           └── templates
	│   └── tools
	├── samples
	│   ├── bookinfo
	│   │   ├── networking
	│   │   ├── platform
	│   │   │   ├── consul
	│   │   │   └── kube
	│   │   │       └── rbac
	│   │   └── policy
	│   ├── certs
	│   ├── health-check
	│   ├── helloworld
	│   ├── httpbin
	│   │   ├── destinationpolicies
	│   │   ├── routerules
	│   │   └── sample-client
	│   ├── https
	│   ├── kubernetes-blog
	│   ├── rawvm
	│   ├── sleep
	│   └── websockets
	└── tools
	    ├── deb
	    ├── githubContrib
	    ├── hyperistio
	    ├── license
	 	└── vagrant

根目录主要有四个文件夹，`bin`、`install`、`samples`、`tools`,安装所需要的yaml文件都在install中。

## 2.部署istio

### 安装对应的CRD

	$ kubectl create -f templates/crds.yaml
	customresourcedefinition.apiextensions.k8s.io "virtualservices.networking.istio.io" created
	customresourcedefinition.apiextensions.k8s.io "destinationrules.networking.istio.io" created
	customresourcedefinition.apiextensions.k8s.io "serviceentries.networking.istio.io" created
	customresourcedefinition.apiextensions.k8s.io "gateways.networking.istio.io" created
	customresourcedefinition.apiextensions.k8s.io "envoyfilters.networking.istio.io" created
	customresourcedefinition.apiextensions.k8s.io "policies.authentication.istio.io" created
	customresourcedefinition.apiextensions.k8s.io "meshpolicies.authentication.istio.io" created
	customresourcedefinition.apiextensions.k8s.io "httpapispecbindings.config.istio.io" created
	customresourcedefinition.apiextensions.k8s.io "httpapispecs.config.istio.io" created
	customresourcedefinition.apiextensions.k8s.io "quotaspecbindings.config.istio.io" created
	customresourcedefinition.apiextensions.k8s.io "quotaspecs.config.istio.io" created
	customresourcedefinition.apiextensions.k8s.io "rules.config.istio.io" created
	customresourcedefinition.apiextensions.k8s.io "attributemanifests.config.istio.io" created
	customresourcedefinition.apiextensions.k8s.io "bypasses.config.istio.io" created
	customresourcedefinition.apiextensions.k8s.io "circonuses.config.istio.io" created
	customresourcedefinition.apiextensions.k8s.io "deniers.config.istio.io" created
	customresourcedefinition.apiextensions.k8s.io "fluentds.config.istio.io" created
	customresourcedefinition.apiextensions.k8s.io "kubernetesenvs.config.istio.io" created
	customresourcedefinition.apiextensions.k8s.io "listcheckers.config.istio.io" created
	customresourcedefinition.apiextensions.k8s.io "memquotas.config.istio.io" created
	customresourcedefinition.apiextensions.k8s.io "noops.config.istio.io" created
	customresourcedefinition.apiextensions.k8s.io "opas.config.istio.io" created
	customresourcedefinition.apiextensions.k8s.io "prometheuses.config.istio.io" created
	customresourcedefinition.apiextensions.k8s.io "rbacs.config.istio.io" created
	customresourcedefinition.apiextensions.k8s.io "redisquotas.config.istio.io" created
	customresourcedefinition.apiextensions.k8s.io "servicecontrols.config.istio.io" created
	customresourcedefinition.apiextensions.k8s.io "signalfxs.config.istio.io" created
	customresourcedefinition.apiextensions.k8s.io "solarwindses.config.istio.io" created
	customresourcedefinition.apiextensions.k8s.io "stackdrivers.config.istio.io" created
	customresourcedefinition.apiextensions.k8s.io "statsds.config.istio.io" created
	customresourcedefinition.apiextensions.k8s.io "stdios.config.istio.io" created
	customresourcedefinition.apiextensions.k8s.io "apikeys.config.istio.io" created
	customresourcedefinition.apiextensions.k8s.io "authorizations.config.istio.io" created
	customresourcedefinition.apiextensions.k8s.io "checknothings.config.istio.io" created
	customresourcedefinition.apiextensions.k8s.io "kuberneteses.config.istio.io" created
	customresourcedefinition.apiextensions.k8s.io "listentries.config.istio.io" created
	customresourcedefinition.apiextensions.k8s.io "logentries.config.istio.io" created
	customresourcedefinition.apiextensions.k8s.io "edges.config.istio.io" created
	customresourcedefinition.apiextensions.k8s.io "metrics.config.istio.io" created
	customresourcedefinition.apiextensions.k8s.io "quotas.config.istio.io" created
	customresourcedefinition.apiextensions.k8s.io "reportnothings.config.istio.io" created
	customresourcedefinition.apiextensions.k8s.io "servicecontrolreports.config.istio.io" created
	customresourcedefinition.apiextensions.k8s.io "tracespans.config.istio.io" created
	customresourcedefinition.apiextensions.k8s.io "rbacconfigs.rbac.istio.io" created
	customresourcedefinition.apiextensions.k8s.io "serviceroles.rbac.istio.io" created
	customresourcedefinition.apiextensions.k8s.io "servicerolebindings.rbac.istio.io" created
	customresourcedefinition.apiextensions.k8s.io "adapters.config.istio.io" created
	customresourcedefinition.apiextensions.k8s.io "instances.config.istio.io" created
	customresourcedefinition.apiextensions.k8s.io "templates.config.istio.io" created
	customresourcedefinition.apiextensions.k8s.io "handlers.config.istio.io" created

详细关于CRD的内容可以查看：[k8s之CRD来扩展API](https://jimmysong.io/posts/kuberentes-crd-custom-resource/)。

### 安装istio，并且开始TLS认证

	kubectl apply -f install/kubernetes/istio-demo-auth.yaml

输出较多可自行查看yaml文件中都具体安装了什么：


* 创建namespace  `istio-system`
* 创建configmap  `istio-galley-configuration`
* 创建configmap  `istio-grafana-custom-resources`
* 创建configmap  `istio-statsd-prom-bridge`
* 创建configmap  `promethues`
* 创建configmap  `istio-security-custom-resources`
* 创建configmap  `istio`
* 创建configmap  `istion-sidecar-injector`
* 创建serviceAccout `istio-gally-service-account`
* 创建serviceAccout `istio-egressgateway-service-account`  
* 创建serviceAccout `istio-ingressgateway-service-account`
* 创建serviceAccout `istio-grafana-post-install-account`
* 创建clusterRole  `istio-grafana-post-install-istio-system`
* 创建clusterRoleBinding  `istio-grafana-post-install-role-binding-istio-system`

太多了，不一一列举，具体可以查看该文件具体内容。

安装完成可查看所相关的资源状态：

	$ kubectl get deployment -n istio-system
	NAME                       DESIRED   CURRENT   UP-TO-DATE   AVAILABLE   AGE
	grafana                    1         1         1            1           1m
	istio-citadel              1         1         1            1           1m
	istio-egressgateway        1         1         1            1           1m
	istio-galley               1         1         1            1           1m
	istio-ingressgateway       1         1         1            1           1m
	istio-pilot                1         1         1            1           1m
	istio-policy               1         1         1            1           1m
	istio-sidecar-injector     1         1         1            1           1m
	istio-statsd-prom-bridge   1         1         1            1           1m
	istio-telemetry            1         1         1            1           1m
	istio-tracing              1         1         1            1           1m
	prometheus                 1         1         1            1           1m
	servicegraph               1         1         1            1           1m

	$ kubectl get service -n istio-system
	NAME                       TYPE           CLUSTER-IP       EXTERNAL-IP   PORT(S)                                                                                   AGE
	grafana                    ClusterIP      10.101.142.85    <none>        3000/TCP                                                                                   2m
	istio-citadel              ClusterIP      10.111.173.106   <none>        8060/TCP,9093/TCP                                                                                   2m
	istio-egressgateway        ClusterIP      10.103.77.66     <none>        80/TCP,443/TCP                                                                                   2m
	istio-galley               ClusterIP      10.105.153.179   <none>        443/TCP,9093/TCP                                                                                   2m
	istio-ingressgateway       LoadBalancer   10.101.203.26    <pending>     80:31380/TCP,443:31390/TCP,31400:31400/TCP,15011:32740/TCP,8060:31537/TCP,15030:31044/TCP,15031:32382/TCP   2m
	istio-pilot                ClusterIP      10.108.201.107   <none>        15010/TCP,15011/TCP,8080/TCP,9093/TCP                                                                       2m
	istio-policy               ClusterIP      10.106.223.102   <none>        9091/TCP,15004/TCP,9093/TCP                                                                                 2m
	istio-sidecar-injector     ClusterIP      10.102.150.180   <none>        443/TCP                                                                                   2m
	istio-statsd-prom-bridge   ClusterIP      10.108.72.155    <none>        9102/TCP,9125/UDP                                                                                   2m
	istio-telemetry            ClusterIP      10.110.226.52    <none>        9091/TCP,15004/TCP,9093/TCP,42422/TCP                                                                       2m
	jaeger-agent               ClusterIP      None             <none>        5775/UDP,6831/UDP,6832/UDP                                                                                  2m
	jaeger-collector           ClusterIP      10.104.30.170    <none>        14267/TCP,14268/TCP                                                                                   2m
	jaeger-query               ClusterIP      10.97.213.174    <none>        16686/TCP                                                                                   2m
	prometheus                 ClusterIP      10.100.243.226   <none>        9090/TCP                                                                                   2m
	servicegraph               ClusterIP      10.109.123.118   <none>        8088/TCP                                                                                   2m
	tracing                    ClusterIP      10.101.67.68     <none>        80/TCP                                                                                   2m
	zipkin                     ClusterIP      10.106.212.88    <none>        9411/TCP

	$ kubectl get configmap -n istio-system
	NAME                                    DATA      AGE
	istio                                   1         3m
	istio-galley-configuration              1         3m
	istio-grafana-custom-resources          2         3m
	istio-ingress-controller-leader-istio   0         2m
	istio-security-custom-resources         2         3m
	istio-sidecar-injector                  1         3m
	istio-statsd-prom-bridge                1         3m
	prometheus                              1         3m

	$ kubectl get po -n istio-system
	NAME                                        READY     STATUS      RESTARTS   AGE
	grafana-66469c4d95-4mcjq                    1/1       Running     0          3m
	istio-citadel-5799b76c66-nrm2k              1/1       Running     0          3m
	istio-cleanup-secrets-jn2fv                 0/1       Completed   0          4m
	istio-egressgateway-657f449d77-rvpxh        1/1       Running     0          3m
	istio-galley-5bf4d6b8f7-mqmg9               1/1       Running     0          3m
	istio-grafana-post-install-r2gps            0/1       Completed   0          4m
	istio-ingressgateway-b55bc6bbb-4glh4        1/1       Running     0          3m
	istio-pilot-c8ff8c54-s428l                  2/2       Running     0          3m
	istio-policy-566866947b-hrq8f               2/2       Running     0          3m
	istio-security-post-install-lgs48           0/1       Completed   1          4m
	istio-sidecar-injector-5b5fcf4df6-lknzp     1/1       Running     0          3m
	istio-statsd-prom-bridge-7f44bb5ddb-8gbxh   1/1       Running     0          3m
	istio-telemetry-5966685789-dg9d5            2/2       Running     0          3m
	istio-tracing-ff94688bb-fq7gw               1/1       Running     0          3m
	prometheus-84bd4b9796-mr4n6                 1/1       Running     0          3m
	servicegraph-7875b75b4f-ph6lq               1/1       Running     0          3m

### istio架构

前面的步骤安装部署了istio的几个关键的部分：

* Pilot
* Mixer
* Ingress-Controller
* Egress-Controller
* Istio-CA(Certificate Authority)

#### Pilot

负责在运行环境中配置Envoy和Mixer。

#### Proxy/Envoy

每个微服务都对应一个sidecar proxy，用来处理服务与服务之间，外部服务和内部服务之间的ingress/egress流量。一个具备安全级别的微服务的sidecar proxy具备了服务发现、七层负载、熔断、策略制定、预测记录及汇报等功能。

#### Mixer

在基础设施之上创建一层可移植，来负责实施具体规则，比如：ACLS、速率限制、配额、认证、请求追踪、遥测收集等。

#### Citadel/Istio CA

在服务与服务之间通过TLS增加安全认证

#### Ingress/Egress

通过路径来转发外部流量

#### Control plane API

处理编排信息，比如k8s和Hashcorp

istio架构如下所示：


![](images/istio_1?raw=true)


（未完待续。。。）
