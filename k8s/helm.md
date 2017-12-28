一个k8s应用会使用k8s的各种资源:Services、Deployments、Ingress.

对于一个比较简单的应用,使用Yaml文件就可以定义其相关的一些资源和配置,但是对于一些复杂的应用,通过Yaml文件的方式很费事.

Helm出现解决了这个问题,helm可以看作是应用的管理器,也可以看做是k8s的包管理工具,也可以看作是k8s的编排工具.

Helm主要是把创建一个应用所需的一个信息定义在一个Charts中,Charts是以一个压缩包的形式存在的,应用的创建只需要对应的Charts即可.

Charts中包含各种所需资源的Yaml文件,单数信息,应用的版本信息以及依赖的其他应用的一些信息.使用Helm进行应用部署具有一下有点:

* 可帮助管理复杂应用
* 应用的升级十分方便,helm提供对应的界面,可以方便的将应用从一个版本升级到另一个版本.
* 便于分享.每个应用以charts的形式存在,可以将对应的charts放在网上进行分享.目前google也提供了一些可以直接使用的charts.
* 版本回退比较方便.

Helm主要由两部分组成,Helm Client和tiller.

Helm Client是客户端,主要是对charts进行管理,和repo(主要是用来存储charts)和tiller进行交互.
tiller主要是监听helm client发送过来的gRPC请求,执行对应用的创建,删除,修改和版本升级和回退等一系列操作.tiller监听到请求之后,解析对应的charts文件,渲染出yaml文件,发送restful API给k8s,k8s接收到请求之后进行操作.

Helm的提出主要是增强了k8s的易用性,尤其是参数配置和版本管理等方面.

openstack-helm的主要目的是将openstack部署到k8s中.

#### openstack-helm和helm的关系是什么:

将openstack的服务容器化部署再k8s中,所需要使用的资源是多种多样的.因此从k8s的角度来看openstack是一个十分复杂的应用.

而Helm的最大优势就是管理复杂应用.在k8s上部署openstack的最大工作就是进行charts的开发,charts包含了创建openstack应用所需的资源和资源之间的相互关系.

而openstack-helm这个项目的最大工作就是进行openstack helm chart的开发.有了openstack chart之后,就可以进行一键部署.

Helm的工作原理
-----------------

## Helm的三个基本概念

* Chart: Helm应用(package),包括该应用所用的Kubernetes manifest模板,类似于YUM RPM或Apt dpkg文件.

* Repository: Helm package存储仓库.

* Release:chart的部署实例,每个chart可以部署一个或多个release.

![Alt text](/home/qsyqian/txt.folder/blog/images/k8s/选区_035.png)

### helm客户端

helm客户端是一个命令行工具，负责管理charts、reprepository和release。它通过gPRC API（使用`kubectl port-forward`将tiller的端口映射到本地，然后再通过映射后的端口跟tiller通信）向tiller发送请求，并由tiller来管理对应的Kubernetes资源。

**安装:**

* 下载源码压缩包:  https://github.com/kubernetes/helm/releases
* 解压缩(`tar -zxvf helm-v2.0.0-linux-amd64.tgz`)
* 找到对应的二进制文件,然后执行 `mv linux-amd64/helm /usr/local/bin/helm`
然后就可以使用 `helm help`

### tiller服务端

tiller接收来自helm客户端的请求，并把相关资源的操作发送到Kubernetes，负责管理（安装、查询、升级或删除等）和跟踪Kubernetes资源。为了方便管理，tiller把release的相关信息保存在kubernetes的ConfigMap中。

tiller对外暴露gRPC API，供helm客户端调用。

### Helm Charts

Helm使用Chart来管理Kubernetes manifest文件。每个chart都至少包括:

* 应用的基本信息Chart.yaml
* 一个或多个Kubernetes manifest文件模版（放置于templates/目录中），可以包括Pod、Deployment、Service等各种Kubernetes资源


#### Chart.yaml示例

    name: The name of the chart (required)
    version: A SemVer 2 version (required)
    description: A single-sentence description of this project (optional)
    keywords:
    - A list of keywords about this project (optional)
    home: The URL of this project's home page (optional)
    sources:
    - A list of URLs to source code for this project (optional)
    maintainers: # (optional)
    - name: The maintainer's name (required for each maintainer)
    email: The maintainer's email (optional for each maintainer)
    engine: gotpl # The name of the template engine (optional, defaults to gotpl)
    icon: A URL to an SVG or PNG image to be used as an icon (optional).


### 依赖管理

Helm支持两种方式管理依赖:

* 直接把依赖的package放到charts/ 目录下

* 使用requirements.yaml,并使用`helm dep up foochart`来自动下载依赖的pachage

    dependencies:
    - name: apache
    version: 1.2.3
    repository: http://example.com/charts
    - name: mysql
    version: 3.2.1
    repository: http://another.example.com/charts

### Chart模版

Chart的模板基于Go remplate和Sprig,比如:

    apiVersion: v1
    kind: ReplicationController
    metadata:
    name: deis-database
    namespace: deis
    labels:
    heritage: deis
    spec:
    replicas: 1
    selector:
    app: deis-database
    template:
    metadata:
      labels:
        app: deis-database
    spec:
      serviceAccount: deis-database
      containers:
        - name: deis-database
          image: {{.Values.imageRegistry}}/postgres:{{.Values.dockerTag}}
          imagePullPolicy: {{.Values.pullPolicy}}
          ports:
            - containerPort: 5432
          env:
            - name: DATABASE_STORAGE
              value: {{default "minio" .Values.storage}}

模板参数的默认值必须放到values.yaml文件中,其格式为:

    imageRegistry: "quay.io/deis"
    dockerTag: "latest"
    pullPolicy: "alwaysPull"
    storage: "s3"

    # 依赖的mysql chart的默认参数
    mysql:
      max_connections: 100
      password: "secret"

### helm插件

插件提供了扩展Helm核心功能的方法，它在客户端执行，并放在$(helm home)/plugins目录中。

一个典型的helm插件格式为

    $(helm home)/plugins/
      |- keybase/
          |
          |- plugin.yaml
          |- keybase.sh

而plugin.yaml文件的格式为:

    name: "keybase"
    version: "0.1.0"
    usage: "Integreate Keybase.io tools with Helm"
    description: |-
      This plugin provides Keybase services to Helm.
    ignoreFlags: false
    useTunnel: false
    command: "$HELM_PLUGIN_DIR/keybase.sh"

这样，就可以用helm keybase命令来使用这个插件。


tpl
