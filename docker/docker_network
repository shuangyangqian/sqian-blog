一.docker自带的三种网络
安装完docker之后会默认创建三种网络:
# docker network ls
NETWORK ID          NAME                DRIVER              SCOPE
459abe925b73        bridge              bridge              local
8f11fa1453bd        host                host                local
e32539ac6829        none                null                local

none网络:
如果给容器加上这个网络,那么容器内部只有lo网络设备.
我们不禁会问，这样一个封闭的网络有什么用呢？
其实还真有应用场景。封闭意味着隔离，一些对安全性要求高并且不需要联网的应用可以使用 none 网络。
比如某个容器的唯一用途是生成随机密码，就可以放到 none 网络中避免密码被窃取。
# docker run -it --network=none busybox
/ # ip a
1: lo: <LOOPBACK,UP,LOWER_UP> mtu 65536 qdisc noqueue qlen 1
    link/loopback 00:00:00:00:00:00 brd 00:00:00:00:00:00
    inet 127.0.0.1/8 scope host lo
       valid_lft forever preferred_lft forever

host网络:
如果给容器添加上host网络,那么容器的网络设备和host的网络设备将会一模一样.
直接使用 Docker host 的网络最大的好处就是性能，如果容器对网络传输效率有较高要求，
则可以选择 host 网络。当然不便之处就是牺牲一些灵活性，比如要考虑端口冲突问题，
Docker host 上已经使用的端口就不能再用了。

bridge网络:
容器安装好之后,查看brctl:
# brctl show
bridge name	bridge id		STP enabled	interfaces
docker0		8000.0242a4f73b8f	no
virbr0		8000.000000000000	yes

其中docker0就是bridge网络默认的网桥.

当创建一个容器之后:
brctl show
bridge name	bridge id		STP enabled	interfaces
docker0		8000.0242a4f73b8f	no		veth0c0bed6
virbr0		8000.000000000000	yes

其中网桥上新加的设备和容器内部的网络设备是veth pair.veth pair 是一种成对出现的特殊网络设备，
可以把它们想象成由一根虚拟网线连接起来的一对网卡，网卡的一头在容器中，另一头挂在网桥 docker0
上，其效果就是将容器中的网络设备也挂在了 docker0 上。
注:如果再创建容器的时候不指定网络,那么容器将会默认使用docker自带的bridge网络

再容器内部可以查看该网络设备的IP,是根据网络的子网信息来给容器分配ip的.
查看一个网络的信息:
# docker inspect bridge
[
    {
        "Name": "bridge",
        "Id": "459abe925b734313cf57ae2cf525ee869994b59b4518e25ecd6b29fc4c145d8b",
        "Created": "2017-11-16T15:17:02.101611582+08:00",
        "Scope": "local",
        "Driver": "bridge",
        "EnableIPv6": false,
        "IPAM": {
            "Driver": "default",
            "Options": null,
            "Config": [
                {
                    "Subnet": "172.17.0.0/16",
                    "Gateway": "172.17.0.1"
                }
            ]
        },
        "Internal": false,
        "Attachable": false,
        "Ingress": false,
        "ConfigFrom": {
            "Network": ""
        },
............

上述可以看到,bridge网络的子网是172.17.0.0/16,那么用该网络创建的容器的IP就会落在该子网中去.
另外,网关172.17.0.1是宿主机host的docker0的IP.
# ifconfig docker0
docker0   Link encap:Ethernet  HWaddr 02:42:a4:f7:3b:8f
          inet addr:172.17.0.1  Bcast:0.0.0.0  Mask:255.255.0.0
          inet6 addr: fe80::42:a4ff:fef7:3b8f/64 Scope:Link
          UP BROADCAST RUNNING MULTICAST  MTU:1500  Metric:1
          RX packets:22687 errors:0 dropped:0 overruns:0 frame:0
          TX packets:23647 errors:0 dropped:0 overruns:0 carrier:0
          collisions:0 txqueuelen:0
          RX bytes:1419201 (1.4 MB)  TX bytes:80544628 (80.5 MB)

二.自己创建网络
docker还支持自己创建网络:
Docker 提供三种 user-defined 网络驱动：bridge, overlay 和 macvlan。
overlay 和 macvlan 用于创建跨主机的网络。

# docker network create --driver bridge bridge1
56c0d10e5d57646da2bdce45af428bab1c9ddfe92fd30771944c9cf719473148
root@docker:~/docker_debug# docker network ls
NETWORK ID          NAME                DRIVER              SCOPE
459abe925b73        bridge              bridge              local
56c0d10e5d57        bridge1             bridge              local
8f11fa1453bd        host                host                local
b32461ec8eb2        my_net              bridge              local
ee737c08db21        my_net2             bridge              local
e32539ac6829        none                null                local

上述命令创建了一个名字为bridge1,驱动为bridge的网络.
# brctl show
bridge name	bridge id		STP enabled	interfaces
br-56c0d10e5d57		8000.0242fd60deff	no
br-b32461ec8eb2		8000.024253496c4e	no
br-ee737c08db21		8000.02425337087a	no
docker0		8000.0242a4f73b8f	no		veth0c0bed6
							vethd446ee7
virbr0		8000.000000000000	yes

使用brctl show查看,会多出来一个网桥,该网桥是以br+network_id的方式明名的.

使用docker inspect bridge1来查看新创建的网络的一些详细信息,docker会自动分配subnet网段,当然也可以自己制定.
eg:#docker network create --driver bridge --subnet 172.22.16.0/24 --gateway 172.22.16.1 bridge2

当然再docker host上也会创建一个对应的网络设备,其IP为网管ip.
当创建完成容器之后,和容器设备互相成为venth pair的设备,网桥设备,都会成为宿主机的网络设备,使用ip a都可以查看到.

创建了自己的网络之后,再运行容器的时候,可以使用自己创建的网络来创建容器
#docker run -it --network=bridge1 busybox
上述情况会再bridge1网络的subnet中分配一个IP给容器

#docker run -it --network=bridge1 --ip 172.22.16.8 busybox
执行上述命令之后,容器的IP就会为172.22.16.8
注:只有网络再创建的时候使用--subnet制定了具体的子网的时候,才能使用静态IP否则使用会报错.

挂在一个bridge网络上的两个容器可以相互之间联通.不同的网络上的不可一联通,比如自己创建的bridge1网络和docker自带的docker0网络

通过查看防火墙规则:
-A DOCKER-ISOLATION -i br-ee737c08db21 -o br-56c0d10e5d57 -j DROP
-A DOCKER-ISOLATION -i br-56c0d10e5d57 -o br-ee737c08db21 -j DROP
-A DOCKER-ISOLATION -i br-b32461ec8eb2 -o br-56c0d10e5d57 -j DROP
-A DOCKER-ISOLATION -i br-56c0d10e5d57 -o br-b32461ec8eb2 -j DROP
-A DOCKER-ISOLATION -i docker0 -o br-56c0d10e5d57 -j DROP
-A DOCKER-ISOLATION -i br-56c0d10e5d57 -o docker0 -j DROP
-A DOCKER-ISOLATION -i br-b32461ec8eb2 -o br-ee737c08db21 -j DROP
-A DOCKER-ISOLATION -i br-ee737c08db21 -o br-b32461ec8eb2 -j DROP

看到不同网络之间的数据包都被对方丢弃了.
从规则的命名 DOCKER-ISOLATION 可知 docker 在设计上就是要隔离不同的 netwrok。
那么接下来的问题是：怎样才能让 busybox 与 httpd 通信呢？
答案是：为 httpd 容器添加一块 net_my2 的网卡。这个可以通过docker network connect 命令实现。
#docker network connect bridge1 $docker_uuid


经过上述步骤之后,容器内不会增加一块网卡.这样就可以时间不同网络之间的容器相互访问了.

三.容器间通信的三种方式:
1.IP通信
从上一节的例子可以得出这样一个结论：两个容器要能通信，必须要有属于同一个网络的网卡。
满足这个条件后，容器就可以通过 IP 交互了。具体做法是在容器创建时通过 --network 指定相应的网络，
或者通过 docker network connect 将现有容器加入到指定网络。可参考上一节 httpd 和 busybox 的例子，这里不再赘述

2.Docker DNS Server
通过 IP 访问容器虽然满足了通信的需求，但还是不够灵活。因为我们在部署应用之前可能无法确定 IP，
部署之后再指定要访问的 IP 会比较麻烦。对于这个问题，可以通过 docker 自带的 DNS 服务解决。
从 Docker 1.10 版本开始，docker daemon 实现了一个内嵌的 DNS server，使容器可以直接通过“容器名”通信。
方法很简单，只要在启动时用 --name 为容器命名就可以了。


下面启动两个容器 bbox1 和 bbox2：
docker run -it --network=my_net2 --name=bbox1 busybox
docker run -it --network=my_net2 --name=bbox2 busybox

3.joined 容器
joined 容器是另一种实现容器间通信的方式。
joined 容器非常特别，它可以使两个或多个容器共享一个网络栈，共享网卡和配置信息，
joined 容器之间可以通过 127.0.0.1 直接通信。请看下面的例子：
先创建一个 httpd 容器，名字为 web1。
#docker run -d -it --name=web1 httpd
然后创建 busybox 容器并通过 --network=container:web1 指定 jointed 容器为 web1：
#docker run -it --network=container:web1 busybox

通过上述设置:busybox 和 web1 的网卡 mac 地址与 IP 完全一样，它们共享了相同的网络栈。busybox 可以直接用 127.0.0.1 访问 web1 的 http 服务。

joined 容器非常适合以下场景：
  1.不同容器中的程序希望通过 loopback 高效快速地通信，比如 web server 与 app server。
  2.希望监控其他容器的网络流量，比如运行在独立容器中的网络监控程序。


四.容器和外网之间相互访问
1.容器访问外网:
默认情况下,docker host可以访问外网,那么容器也是可以访问外网的.
通过观察,执行iptables -t nat -S,会出现下列规则:
...
-A POSTROUTING -s 172.19.0.0/16 ! -o br-56c0d10e5d57 -j MASQUERADE
-A POSTROUTING -s 172.22.16.0/24 ! -o br-ee737c08db21 -j MASQUERADE
-A POSTROUTING -s 172.18.0.0/16 ! -o br-b32461ec8eb2 -j MASQUERADE
-A POSTROUTING -s 172.17.0.0/16 ! -o docker0 -j MASQUERADE
...
含义是:如果网桥 docker0 收到来自 172.17.0.0/16 网段的外出包，把它交给
MASQUERADE 处理。而 MASQUERADE 的处理方式是将包的源地址替换成 host 的地址发送出去，
即做了一次网络地址转换（NAT）。

默认路由通过 enp0s3 发出去，所以我们要同时监控 enp0s3 和 docker0 上的 icmp（ping）数据包。
  1.busybox 发送 ping 包：172.17.0.2 > www.bing.com。
  2.docker0 收到包，发现是发送到外网的，交给 NAT 处理。
  3.NAT 将源地址换成 enp0s3 的 IP：10.0.2.15 > www.bing.com。
  4.ping 包从 enp0s3 发送出去，到达 www.bing.com。

通过 NAT，docker 实现了容器对外网的访问。

2.外网访问容器(端口映射)

docker 可将容器对外提供服务的端口映射到 host 的某个端口，外网通过该端口访问容器。
容器启动时通过-p参数映射端口：

#docker run -d -p 80 httpd
容器启动后，可通过 docker ps 或者 docker port 查看到 host 映射的端口。
在上面的例子中，httpd 容器的 80 端口被映射到 host 32773 上，
这样就可以通过 <host ip>:<32773> 访问容器的 web 服务了

#docker run -d -p 80:80 httpd
除了映射动态端口，也可在 -p 中指定映射到 host 某个特定端口，
例如可将 80 端口映射到 host 的 8080 端口：

每一个映射的端口，host 都会启动一个 docker-proxy 进程来处理访问容器的流量：
  1.docker-proxy 监听 host 的 32773 端口。
  2.当 curl 访问 10.0.2.15:32773 时，docker-proxy 转发给容器 172.17.0.2:80。
  3.httpd 容器响应请求并返回结果。
