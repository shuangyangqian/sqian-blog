## Developing Templates

该文档主要针对下述事情进行描述:

* Helm Template 的语法
* 如何使用values.yaml
* 使用Templates进行开发的一些技术点

### 从一个Charts Template开始

#### charts

```
mychart/
  Chart.yaml
  values.yaml
  charts/
  templates/
  ...```

一个charts的典型结构如上所示,我们把templates下的文件全部删除,然后创建我们的template.

创建第一个template:`mychart/templates/configmap.yaml`:

```
apiVersion: v1
kind: ConfigMap
metadata:
  name: mychart-configmap
data:
  myvalue: "Hello World"
```

ConfigMap在k8s中是一个特别simply的container用来存储配置数据.其他的一些things,比如pods,就可以使用ConfigMap中的数据.

template的命名没什么特殊的要求,但是建议使用.yaml来命名YAML文件,.tpl来命名helpers文件.

通过上述步骤,得到了一个可以安装的charts,我们可以通过下属命令来进行安装:

```
$ helm install ./mychart
NAME: full-coral
LAST DEPLOYED: Tue Nov  1 17:36:01 2016
NAMESPACE: default
STATUS: DEPLOYED

RESOURCES:
==> v1/ConfigMap
NAME                DATA      AGE
mychart-configmap   1         1m
```
通过helm命令我们可以检查我们安装的charts,来看看实际上的template被渲染成什么样子了:

```
$ helm get manifest full-coral

---
# Source: mychart/templates/configmap.yaml
apiVersion: v1
kind: ConfigMap
metadata:
  name: mychart-configmap
data:
  myvalue: "Hello World"
```
上述命令中每个resource前都有---来进行分割

helm install --debug --dry-run ./mychart

只输出渲染的结果  并不完全安装指定的charts

## helm中的一些build-in objects:

helm内置了一些参数,可以供在定义template的时候使用:

eg:
* Release object对象主要是获取一些release时候的参数,比如time,name等.`{{.Release.Name}}`

* Values 这个对象主要是将values.yaml中的参数传到template中去,默认的情况,Values object是空的.

* Chart 这个object中主要是从Chart.yaml中取值

* Files 这个object主要是针对文件进行操作

    * `Files.Get` 通过文件名获取文件的一个function  `.Files.Get config.ini`
    * `Files.GetBytes` 通过字节取文件内容而不是通过string

* Capabilities  这个object主要是提供了k8s集群所支持的一些特性.

    * `Capabilities.APIVersions`
    * `Capabilities.APIVersions.Has $version` 表明version在k8s集群中是否被enabled
    * `Capabilities.KubeVersion` 提供了集中获取k8s版本的方法,具有一下几个属性: `Major, Minor, GitVersion, GitCommit, GitTreeState, BuildDate, GoVersion, Compiler, and Platform`
    * `Capabilities.TillerVersion` 提供了查询tiller的version的方法,有一下几个属性: `SemVer, GitCommit, and GitTreeState`

* Template 这个object主要是关于当前即将被执行的template.

    * `Name` 当前template的namespace filepath,比如: `mychart/templates/mytemplate.yaml`
    * `BasePath` 当前chart的template的namespace的路径, 比如: `mychart/templates`

## Values Files

前面介绍的build-in object中有一个Values,这个object主要是向chart中传参数,他的内容主要来源于四个部分:

* values.yaml文件
* 如果是一个subchart,也包括了其parent chart的values.yaml文件
* 在helm install或者helm update的时候通过-f参数传入的,比如: `helm install -f myvals.yaml ./mychart`
* 通过--set传入的一些特殊的参数,比如: `helm install --set foo=bar ./mychart`

上述四部分的优先级顺序是,默认的是values.yaml,但是可以被parent chart的values.yaml给覆盖掉,也可以被通过参数--set传入的参数值给覆盖.

使用方法:

例子1:

在values.yaml中定义参数,如:

```favoriteDrink: coffee```

然后在template文件中使用,如:

```
apiVersion: v1
kind: ConfigMap
metadata:
  name: {{ .Release.Name }}-configmap
data:
  myvalue: "Hello World"
  drink: {{ .Values.favoriteDrink }}
```

例子2:

在values.yaml中定义参数,如:

```
favorite:
  drink: coffee
  food: pizza
```

然后在template文件中使用,如:

```
apiVersion: v1
kind: ConfigMap
metadata:
  name: {{ .Release.Name }}-configmap
data:
  myvalue: "Hello World"
  drink: {{ .Values.favorite.drink }}
  food: {{ .Values.favorite.food }}
```

## 模板函数和管道

从最简单的开始,当从values.yaml文件中向template中传参数的时候,需要对string类型的参数进行加引号,可以调用`quota`函数来对参数加引号,如:

```
apiVersion: v1
kind: ConfigMap
metadata:
  name: {{ .Release.Name }}-configmap
data:
  myvalue: "Hello World"
  drink: {{ quote .Values.favorite.drink }}
  food: {{ quote .Values.favorite.food }}
```

template function遵循的规则是 `functionName arg1 arg2....`. 上面的代码显示,向quota函数中传入了一个参数: `quote .Values.favorite.food`.

helm本身有60多个函数,一部分是Go模板语言本身的函数,还有一部分是 Sprig template library来的.

### 管道

通过使用管道,上述例子可以写成下述形式:

```
apiVersion: v1
kind: ConfigMap
metadata:
  name: {{ .Release.Name }}-configmap
data:
  myvalue: "Hello World"
  drink: {{ .Values.favorite.drink | quote }}
  food: {{ .Values.favorite.food | quote }}
```

or

```
apiVersion: v1
kind: ConfigMap
metadata:
  name: {{ .Release.Name }}-configmap
data:
  myvalue: "Hello World"
  drink: {{ .Values.favorite.drink | quote }}
  food: {{ .Values.favorite.food | upper | quote }}
```

在使用过程中,你会发现使用管道的形式会更常用.

repeat 函数:

```
apiVersion: v1
kind: ConfigMap
metadata:
  name: {{ .Release.Name }}-configmap
data:
  myvalue: "Hello World"
  drink: {{ .Values.favorite.drink | repeat 5 | quote }}
  food: {{ .Values.favorite.food | upper | quote }}
```

default 函数:

`default DEFAULT_VALUE GIVEN_VALUE`, 通过这句话可以定义一个默认的参数,一旦这个参数被忽略了,就会使用默认的参数值,like:

```
drink: {{ .Values.favorite.drink | default "tea" | quote }}
```

运算符也是函数:

`eq, ne, lt, gt, and, or` 是通过函数的形式实现的.通过圆括号()进行组合使用

## 流程控制(Flow Contol)

helm提供了下述三种流程控制方式:

* if/else
* with
* range

除此之外,还有一些action来进行生命和使用template部分,如:

* define 在当前template中声明一个新的template
* template import一个template
* block  声明一个可以填充的template area

### if/else

基本的结构是:

```
{{ if PIPELINE }}
  # Do something
{{ else if OTHER PIPELINE }}
  # Do something else
{{ else }}
  # Default case
{{ end }}```

当具备下述情况的时候,一个管道被认为是false:

* a boolean false
* a numeric zero
* an empty string
* a nil (empty or null)
* an empty collection (map, slice, tuple, dict, array)

举个例子:

```
apiVersion: v1
kind: ConfigMap
metadata:
  name: {{ .Release.Name }}-configmap
data:
  myvalue: "Hello World"
  drink: {{ .Values.favorite.drink | default "tea" | quote }}
  food: {{ .Values.favorite.food | upper | quote }}
  {{ if eq .Values.favorite.drink "coffee" }}mug: true{{ end }}
```

上述例子中,当`.Values.favorite.drink`的值为coffee的时候,会输出`mug: true`,否则,不会输出.

### 注意空格(缩进)

* {{-  xxxx }}  这样写的话,会将左边的空行删掉
* {{ xxxxxxx -}} 这样写的话,会将右边的空行删掉

### with

基本结构:

```
{{ with PIPELINE }}
  # restricted scope
{{ end }}
```

举个例子:

```
apiVersion: v1
kind: ConfigMap
metadata:
  name: {{ .Release.Name }}-configmap
data:
  myvalue: "Hello World"
  {{- with .Values.favorite }}
  drink: {{ .drink | default "tea" | quote }}
  food: {{ .food | upper | quote }}
  {{- end }}
```

在with这个块内,可以直接使用`.food`和`.drink`,不需要使用`.Values.favorite.drink`之类的.

### range action

values.yaml文件如下:

```
favorite:
  drink: coffee
  food: pizza
pizzaToppings:
  - mushrooms
  - cheese
  - peppers
  - onions
```

然后在template中可以这么写:

```
apiVersion: v1
kind: ConfigMap
metadata:
  name: {{ .Release.Name }}-configmap
data:
  myvalue: "Hello World"
  {{- with .Values.favorite }}
  drink: {{ .drink | default "tea" | quote }}
  food: {{ .food | upper | quote }}
  {{- end }}
  toppings: |-
    {{- range .Values.pizzaToppings }}
    - {{ . | title | quote }}
    {{- end }}

```
含义大概就是,`.`代表了上述values中的参数,循环取得,渲染template之后如下:

```
# Source: mychart/templates/configmap.yaml
apiVersion: v1
kind: ConfigMap
metadata:
  name: edgy-dragonfly-configmap
data:
  myvalue: "Hello World"
  drink: "coffee"
  food: "PIZZA"
  toppings: |-
    - "Mushrooms"
    - "Cheese"
    - "Peppers"
    - "Onions"
```

除此之外,上述例子的`  toppings: |-`定义了一个multi-line string.因此这里topping实际上不是一个YAML list,是一个big string.因为k8s的configmaps中的data是又key/value组成的,key和value都是简单的string.可以参考: https://kubernetes.io/docs/tasks/configure-pod-container/configmap/.

举个k8s的configmaps的例子:

```
apiVersion: v1
data:
  game.properties: |
    enemies=aliens
    lives=3
    enemies.cheat=true
    enemies.cheat.level=noGoodRotten
    secret.code.passphrase=UUDDLRLRBABAS
    secret.code.allowed=true
    secret.code.lives=30
  ui.properties: |
    color.good=purple
    color.bad=yellow
    allow.textmode=true
    how.nice.to.look=fairlyNice
kind: ConfigMap
metadata:
  creationTimestamp: 2016-02-18T18:52:05Z
  name: game-config
  namespace: default
  resourceVersion: "516"
  selfLink: /api/v1/namespaces/default/configmaps/game-config-2
  uid: b4952dc3-d670-11e5-8cd0-68f728db1985```


### 变量

举个例子:

```
{{- with .Values.favorite }}
 drink: {{ .drink | default "tea" | quote }}
 food: {{ .food | upper | quote }}
 release: {{ .Release.Name }}
 {{- end }}
```
这个例子中  `.Release.Name`并不在with所定义的块中,如何解决这种问题呢

```
apiVersion: v1
kind: ConfigMap
metadata:
  name: {{ .Release.Name }}-configmap
data:
  myvalue: "Hello World"
  {{- $relname := .Release.Name -}}
  {{- with .Values.favorite }}
  drink: {{ .drink | default "tea" | quote }}
  food: {{ .food | upper | quote }}
  release: {{ $relname }}
  {{- end }}
```

上述例子中首先定义了 `$relname`,使用`:=`来进行赋值,然后就可以再with块中使用这个参数值.

变量再range中使用更为方便,如下:

例子1:

```
toppings: |-
    {{- range $index, $topping := .Values.pizzaToppings }}
      {{ $index }}: {{ $topping }}
    {{- end }}
```

渲染出来如下:

```
toppings: |-
    0: mushrooms
    1: cheese
    2: peppers
    3: onions
```

例子2:

```
apiVersion: v1
kind: ConfigMap
metadata:
  name: {{ .Release.Name }}-configmap
data:
  myvalue: "Hello World"
  {{- range $key, $val := .Values.favorite }}
  {{ $key }}: {{ $val | quote }}
  {{- end}}```

输出:

```
# Source: mychart/templates/configmap.yaml
apiVersion: v1
kind: ConfigMap
metadata:
  name: eager-rabbit-configmap
data:
  myvalue: "Hello World"
  drink: "coffee"
  food: "pizza"
```

## Named Templates

可以创建一个template,然后再别处使用它.

### PARTIALS AND _ FILES

需要注意一下几点

* templates/中的而大多数文件都会被k8s看做成manifests
* NOTES.txt是个例外
* 名字前边是以`_`开头的话,会被假设认为是里面没有manifest的.不会被k8s渲染,但是可以被其他chart使用.

### 使用define和template来声明和使用templates

基本语法:

```
{{ define "MY_NAME" }}
  # body of template here
{{ end }}
```

eg:

```
{{- define "my_labels" }}
  labels:
    generator: helm
    date: {{ now | htmlDate }}
{{- end }}

```
然后可以把这个template插入到别的template中去,使用template action来进行引用,比如:

```
{{- define "my_labels" }}
  labels:
    generator: helm
    date: {{ now | htmlDate }}
{{- end }}
apiVersion: v1
kind: ConfigMap
metadata:
  name: {{ .Release.Name }}-configmap
  {{- template "my_labels" }}
data:
  myvalue: "Hello World"
  {{- range $key, $val := .Values.favorite }}
  {{ $key }}: {{ $val | quote }}
  {{- end }}
```

渲染出来的结果是:

```
# Source: mychart/templates/configmap.yaml
apiVersion: v1
kind: ConfigMap
metadata:
  name: running-panda-configmap
  labels:
    generator: helm
    date: 2016-11-02
data:
  myvalue: "Hello World"
  drink: "coffee"
  food: "pizza"
```

常规情况下,helm chart会把这些templates放到一个单独的文件中,如`_helpers.tpl`.比如:

```
{{/* Generate basic labels */}}
{{- define "my_labels" }}
  labels:
    generator: helm
    date: {{ now | htmlDate }}
{{- end }}
```

惯例,define函数再定义的时候,需要使用注释块来进行描述是来干啥的,`{{/* ... */}}`.

尽管上述定义已经被移动到`_helpers.tpl`中去了,但是再configmap.yaml中仍然可以使用,如:

```
apiVersion: v1
kind: ConfigMap
metadata:
  name: {{ .Release.Name }}-configmap
  {{- template "my_labels" }}
data:
  myvalue: "Hello World"
  {{- range $key, $val := .Values.favorite }}
  {{ $key }}: {{ $val | quote }}
  {{- end }}
```

note:需要记住一点的是,再定义template的时候,那么是global的.如果重复定义相同名字的template,那么将会出现,If you declare two templates with the same name, whichever one is loaded last will be the one used. 因此,再定义template的时候最好不要重名.

### SETTING THE SCOPE OF A TEMPLATE

重新定义下述template:

```
{{/* Generate basic labels */}}
{{- define "my_labels" }}
  labels:
    generator: helm
    date: {{ now | htmlDate }}
    chart: {{ .Chart.Name }}
    version: {{ .Chart.Version }}
{{- end }}
```

如果渲染,会得到:

```
# Source: mychart/templates/configmap.yaml
apiVersion: v1
kind: ConfigMap
metadata:
  name: moldy-jaguar-configmap
  labels:
    generator: helm
    date: 2016-11-02
    chart:
    version:
```

得不到对应的chart.name 和chart.version,但是当template被引入到mainfest的时候,就会得到对应的值.

其实上述template和include是没什么特别大的区别的,都是从别处引入一块template.区别是template是一个action,include是一个函数.函数可以使用管道.

```
apiVersion: v1
kind: ConfigMap
metadata:
  name: {{ .Release.Name }}-configmap
  labels:
{{ include "mychart_app" . | indent 4 }}
data:
  myvalue: "Hello World"
  {{- range $key, $val := .Values.favorite }}
  {{ $key }}: {{ $val | quote }}
  {{- end }}
{{ include "mychart_app" . | indent 2 }}```

可以看到通过管道符,可以对引入的template进行缩进处理.

### Accessing Files Inside Templates

`.Files` object


https://docs.helm.sh/chart_template_guide/#basic-example


### subchart and global Values

关于subchart需要知道以下几点:

* subchart是一个独立的chart,也就是说subchart并不一定是明确依赖其parent chart的
* subchart不能够使用其parent chart的values
* parent chart可以overwrite其subchart的values
* helm可以通过定义global values,global values可以被所有的chart使用

如何定义global values,如下,在values.yaml中定义global values:

```
favorite:
  drink: coffee
  food: pizza
pizzaToppings:
  - mushrooms
  - cheese
  - peppers
  - onions

mysubchart:
  dessert: ice cream

global:
  salad: caesar
```
然后在parent chart和subchart中都可以使用该global values:

如在`mychart/templates/configmap.yaml`中:

```
apiVersion: v1
kind: ConfigMap
metadata:
  name: {{ .Release.Name }}-configmap
data:
  salad: {{ .Values.global.salad }}
```

在`mysubchart/templates/configmap.yaml`中:

```
apiVersion: v1
kind: ConfigMap
metadata:
  name: {{ .Release.Name }}-cfgmap2
data:
  dessert: {{ .Values.dessert }}
  salad: {{ .Values.global.salad }}
```

上述mysubchart是mychart中的一个subchart,也就是说mychart中的目录chart中包含了mysubchart文件夹.

渲染过后可得到如下输出:

```
# Source: mychart/templates/configmap.yaml
apiVersion: v1
kind: ConfigMap
metadata:
  name: silly-snake-configmap
data:
  salad: caesar

---
# Source: mychart/charts/mysubchart/templates/configmap.yaml
apiVersion: v1
kind: ConfigMap
metadata:
  name: silly-snake-cfgmap2
data:
  dessert: ice cream
  salad: caesar
```

### SHARING TEMPLATES WITH SUBCHARTS

subchart和parent chart是共享template模板的.在任何一个chart定义的template对于另外一个chart都是可以直接使用的.



## Best Practics

未完待续
