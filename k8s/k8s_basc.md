
k8s基础知识
===============

1.Node:
---------------
Node作为集群中的工作节点，运行真正的应用程序，在Node上Kubernetes管理的最小运行单元是Pod。
Node上运行着Kubernetes的Kubelet、kube-proxy服务进程，这些服务进程负责Pod的创建、启动、
监控、重启、销毁、以及实现软件模式的负载均衡。

Node包含的信息：
Node地址：主机的IP地址，或Node ID。
Node的运行状态：Pending、Running、Terminated三种状态。
Node Condition：…
Node系统容量：描述Node可用的系统资源，包括CPU、内存、最大可调度Pod数量等。
其他：内核版本号、Kubernetes版本等。
查看Node信息：

    kubectl describe node

2.Pod
----------------
Pod是Kubernetes最基本的操作单元，包含一个或多个紧密相关的容器，一个Pod可以被一个容器化的环境看
作应用层的“逻辑宿主机”；一个Pod中的多个容器应用通常是紧密耦合的，Pod在Node上被创建、启动或者销毁；
每个Pod里运行着一个特殊的被称之为Pause的容器，其他容器则为业务容器，这些业务容器共享Pause容器的
网络栈和Volume挂载卷，因此他们之间通信和数据交换更为高效，在设计时我们可以充分利用这一特性将一组
密切相关的服务进程放入同一个Pod中。

同一个Pod里的容器之间仅需通过localhost就能互相通信。

![Alt text](http://ozp4u2hgy.bkt.clouddn.com/17-11-20/18469286.jpg)

一个Pod中的应用容器共享同一组资源：

* PID命名空间：Pod中的不同应用程序可以看到其他应用程序的进程ID；

* 网络命名空间：Pod中的多个容器能够访问同一个IP和端口范围；

* IPC命名空间：Pod中的多个容器能够使用SystemV IPC或POSIX消息队列进行通信；

* UTS命名空间：Pod中的多个容器共享一个主机名；

* Volumes（共享存储卷）：Pod中的各个容器可以访问在Pod级别定义的Volumes；

Pod的生命周期通过Replication Controller来管理；通过模板进行定义，然后分配到一个Node上运行，在Pod所包含容器运行结束后，Pod结束。

Kubernetes为Pod设计了一套独特的网络配置，包括：为每个Pod分配一个IP地址，使用Pod名作为容器间通信的主机名等。
