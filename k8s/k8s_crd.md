# 自定义资源
一种资源就是Kubernetes API中的一个端点，它存储着某种API 对象的集合。 
例如，内建的pods资源包含Pod对象的集合。

自定义资源是对Kubernetes API的一种扩展，它对于每一个Kubernetes集群不一定可用。
换句话说，它代表一个特定Kubernetes的定制化安装。

在一个运行中的集群内，自定义资源可以通过动态注册出现和消失，集群管理员可以独立于集群本身更新自定义资源。
一旦安装了自定义资源，用户就可以通过kubectl创建和访问他的对象，就像操作内建资源pods那样。

# 自定义控制器

自定义资源本身让你简单地存储和索取结构化数据。

只有当和控制器结合后，他们才成为一种真正的declarative API。 控制器将结构化数据解释为用户所期望状态的记录，并且不断地采取行动来实现和维持该状态。

定制化控制器是用户可以在运行中的集群内部署和更新的一个控制器，它独立于集群本身的生命周期。 定制化控制器可以和任何一种资源一起工作，当和定制化资源结合使用时尤其有效。

# 定制化资源定义
CustomResourceDefinition (CRD)是一个内建的API, 它提供了一个简单的方式来创建自定义资源。
部署一个CRD到集群中使Kubernetes API服务端开始为你指定的自定义资源服务。

这使你不必再编写自己的API服务端来处理自定义资源，但是这种实现的一般性意味着比你使用API server aggregation缺乏灵活性。

# 创建一个CRD
当创建一个新的自定义资源定义（CRD）时，Kubernetes API Server 通过创建一个新的RESTful资源路径进行应答，无论是在命名空间还是在集群范围内，正如在CRD的`scope`域指定的那样。
与现有的内建对象一样，删除一个命名空间将会删除该命名空间内所有的自定义对象。
CRD本身并不区分命名空间，对所有的命名空间可用。

例如，如果将以下的CRD保存到resourcedefinition.yaml中:

	apiVersion: apiextensions.k8s.io/v1beta1
	kind: CustomResourceDefinition
	metadata:	
	  # name must match the spec fields below, and be in the form: <plural>.<group>
	  name: crontabs.stable.example.com
	spec:
	  # group name to use for REST API: /apis/<group>/<version>
	  group: stable.example.com
	  # version name to use for REST API: /apis/<group>/<version>
	  version: v1
	  # either Namespaced or Cluster
	  scope: Namespaced
	  names:
	    # plural name to be used in the URL: /apis/<group>/<version>/<plural>
	    plural: crontabs
	    # singular name to be used as an alias on the CLI and for display
	    singular: crontab
	    # kind is normally the CamelCased singular type. Your resource manifests use this.
	    kind: CronTab
	    # shortNames allow shorter string to match your resource on the CLI
	    shortNames:
	    - ct


创建它：

	kubectl create -f resourcedefinition.yaml

然后一个新的区分命名空间的RESTful API 端点被创建了：

	/apis/stable.example.com/v1/namespaces/*/crontabs/...

然后可以使用此端点URL来创建和管理自定义对象。 这些对象的kind就是你在上面创建的CRD中指定的CronTab对象。

# 创建自定义对象

在CRD对象创建完成之后，你可以创建自定义对象了。自定义对象可以包含自定义的字段。这些字段可以包含任意的JSON。

以下的示例中，在一个自定义对象CronTab种类中设置了cronSpec和image字段。这个CronTab种类来自于你在上面创建的CRD对象。

	apiVersion: "stable.example.com/v1"
	kind: CronTab
	metadata:
	  name: my-new-cron-object
	spec:
	  cronSpec: "* * * * /5"
	  image: my-awesome-cron-image

创建它：

	kubectl create -f my-crontab.yaml

你可以使用kubectl来管理你的CronTab对象。例如：

	kubectl get crontab

应该打印这样的一个列表：

	NAME                 KIND
	my-new-cron-object   CronTab.v1.stable.example.com

注意当使用kubectl时，资源名称是大小写不敏感的，你可以使用单数或者复数形式以及任何缩写在CRD中定义资源。

你还可以查看原始的JSON数据：

	kubectl get ct -o yaml

你应该可以看到它包含了自定义的cronSpec和image字段，来自于你用于创建它的yaml:

	apiVersion: v1
	items:
	- apiVersion: stable.example.com/v1
	  kind: CronTab
	  metadata:
    	clusterName: ""
    	creationTimestamp: 2017-05-31T12:56:35Z
    	deletionGracePeriodSeconds: null
    	deletionTimestamp: null
    	name: my-new-cron-object
    	namespace: default
    	resourceVersion: "285"
    	selfLink: /apis/stable.example.com/v1/namespaces/default/crontabs/my-new-cron-object
    	uid: 9423255b-4600-11e7-af6a-28d2447dc82b
	  spec:
    	cronSpec: '* * * * /5'
    	image: my-awesome-cron-image
	kind: List
	metadata:
	  resourceVersion: ""
	  selfLink: ""