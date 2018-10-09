# openvswitch

## 1.什么是openvswitch
OpenvSwitch，简称OVS是一个虚拟交换软件，主要用于虚拟机VM环境，作为一个虚拟交换机，
支持Xen/XenServer, KVM, and VirtualBox多种虚拟化技术。

在这种某一台机器的虚拟化的环境中，一个虚拟交换机（vswitch）主要有两个作用：
传递虚拟机VM之间的流量，以及实现VM和外界网络的通信。

整个OVS代码用C写的。目前有以下功能：

    Standard 802.1Q VLAN model with trunk and access ports
    NIC bonding with or without LACP on upstream switch
    NetFlow, sFlow(R), and mirroring for increased visibility
    QoS (Quality of Service) configuration, plus policing
    GRE, GRE over IPSEC, VXLAN, and LISP tunneling
    802.1ag connectivity fault management
    OpenFlow 1.0 plus numerous extensions
    Transactional configuration database with C and Python bindings
    High-performance forwarding using a Linux kernel module

## 2.组成部分

- ovs-vswitchd：守护程序，实现交换功能，和Linux内核兼容模块一起，实现基于流的交换flow-based switching。
- ovsdb-server：轻量级的数据库服务，主要保存了整个OVS的配置信息，包括接口啊，交换内容，VLAN啊等等。ovs-vswitchd会根据数据库中的配置信息工作。
- ovs-dpctl：一个工具，用来配置交换机内核模块，可以控制转发规则。
- ovs-vsctl：主要是获取或者更改ovs-vswitchd的配置信息，此工具操作的时候会更新ovsdb-server中的数据库。
- ovs-appctl：主要是向OVS守护进程发送命令的，一般用不上。
- ovsdbmonitor：GUI工具来显示ovsdb-server中数据信息。
- ovs-controller：一个简单的OpenFlow控制器
- ovs-ofctl：用来控制OVS作为OpenFlow交换机工作时候的流表内容。

### 工作原理

在网络中，交换机和桥都是同一个概念，OVS实现了一个虚拟机的以太交换机，换句话说，OVS也就是实现了一个以太桥。
那么，在OVS中，给一个交换机，或者说一个桥，用了一个专业的名词，叫做DataPath！

要了解，OVS如何工作，首先需要知道桥的概念。

网桥也叫做桥接器，连接两个局域网的设备，网桥工作在数据链路层，将两个LAN连接，根据MAC地址来转发帧，可以看成一个“低层的路由器”（路由器工作在网络层，根据IP地质进行转发）。

## 3.网桥的工作原理

网桥处理包遵循以下几条规则：

- 在一个接口上接收到的包不会再往那个接口上发送此包。
- 每个接收到的包都要学习其源MAC地址。
- 如果数据包是多播或者广播包（通过2层MAC地址确定）则要向接收端口以外的所有端口转发，如果上层协议感兴趣，则还会递交上层处理。
- 如果数据包的地址不能再CAM表中找到，则向接收端口以外的其他端口转发。
- 如果CAM表中能找到，则转发给相应端口，如果发送和接收都是统一端口，则不发送。


### OVS中的bridge:
	
	#ovs-vsctl add-br $brname(br-int)
	root@Compute2:~# ifconfig
    	  br-int    Link encap:Ethernet  HWaddr 1a:09:56:ea:0b:49
    	  inet6 addr: fe80::1809:56ff:feea:b49/64 Scope:Link
    	  UP BROADCAST RUNNING MULTICAST  MTU:1500  Metric:1
    	  RX packets:1584 errors:0 dropped:0 overruns:0 frame:0
    	  TX packets:6 errors:0 dropped:0 overruns:0 carrier:0
    	  collisions:0 txqueuelen:0
    	  RX bytes:316502 (316.5 KB)  TX bytes:468 (468.0 B)

当我们创建了一个交换机（网桥）以后，此时网络功能不受影响，但是会产生一个虚拟网卡，名字就是brname，之所以会产生一个虚拟网卡，是为了实现接下 来的网桥（交换机）功能。有了这个交换机以后，我还需要为这个交换机增加端口(port)，一个端口，就是一个物理网卡，当网卡加入到这个交换机之后，其工作方式就和普通交换机的一个端口的工作方式类似了。

	#ovs-vsctl add-port $brname(br-int) port

这里要特别注意，网卡加入网桥以后，要按照网桥的工作标准工作，那么加入的一个端口就必须是以混杂模式工作，工作在链路层，处理2层的帧，所以这个port就不需要配置IP了。（你没见过哪个交换的端口有IP的吧）,那么接下来你可能会问，通常的交换机不都是有一个管理接口，可以telnet到交换机上进行配置吧，那么在OVS中创建的虚拟交换机有木有这种呢，有的！

上面既然创建交换机brname的时候产生了一个虚拟网口brname,那么，你给这个虚拟网卡配置了IP以后，就相当于给交换机的管理接口配置了IP， 此时一个正常的虚拟交换机就搞定了。

	#ip address add 192.168.1.1/24 dev brname

最后，我们来看看一个br的具体信息：

	root@Compute2:~# ovs-vsctl show
	bc12c8d2-6900-42dd-9c1c-30e8ecb99a1b
	Bridge "br0"
    	Port "eth0"
    	    Interface "eth0"
    	Port "br0"
    	    Interface "br0"
    	        type: internal
	ovs_version: "1.4.0+build0"

首先，这里显示了一个名为br0的桥（交换机），这个交换机有两个接口,一个是eth0，一个是br0，上面说到，创建桥的时候会创建一个和桥名字一样的接口，并自动作为该桥的一个端口，那么这个虚拟接口的作用，一方面是可以作为交换机的管理端口，另一方面也是基于这个虚拟接口，实现了桥的功能。

### 例子

这一部分我以一个简单的例子，说明在虚拟化环境中OpenvSwitch的典型工作流程。


1. VM实例instance产生一个数据包并发送至实例内的虚拟网络接口VNIC，图中就是instance中的eth0.
2. 这个数据包会传送到物理节点上的VNIC接口，如图就是vnet接口。
3. 数据包从vnet NIC出来，到达桥（虚拟交换机）br100上.
4. 数据包经过交换机的处理，从物理节点上的物理接口发出，如图中物理节点上的eth0.
5. 数据包从eth0出去的时候，是按照物理节点上的路由以及默认网关操作的，这个时候该数据包其实已经不受你的控制了。



## 安装:

ubuntu下安装ovs:

	sudo apt-get install openvswitch-controller openvswitch-switch openvswitch-datapath-source

### 1.安装完成之后,使用下列命令创建第一个网桥
	
	#sudo ovs-vsctl add-br ovs-1
	#ip a
	9: ovs-1: <BROADCAST,UP,LOWER_UP> mtu 1500 qdisc noqueue state UNKNOWN group default qlen 1
    	link/ether 7a:57:2c:59:fe:4a brd ff:ff:ff:ff:ff:ff
    	inet6 fe80::cc43:23ff:fe23:e74/64 scope link
    	   valid_lft forever preferred_lft forever
	#ovs-vsctl show
	38d557d3-0045-40dc-bc5e-cd60a9b8aaea
    	Bridge "ovs-1"
    	    Port "ovs-1"
    	        Interface "ovs-1"
    	            type: internal
    	ovs_version: "2.0.2"

### 2.进行OVS设置

进行OVS设置的时候很容易造成虚拟交换机与物理交换机构成二层环路（比如虚拟交换机包含两块网卡，而这两块网卡都连接到物理交换机上，就是一个环路），一旦有广播报文，比如ARP请求，就会引发广播风暴，使网络瘫痪。因此，应该把虚拟交换机开启STP支持，避免广播风暴：

	# ovs-vsctl set bridge ovs-1 stp_enable=true

### 3.启动要添加到虚拟交换机ovs-1上的物理端口（物理网卡，这里是eth0）。

如果ifconfig里已经有了，
那就不用重新启动了。

	sudo ifconfig eth0 up

### 4.添加物理端口到虚拟交换机ovs-1：

	sudo ovs-vsctl add-port ovs-1 eth0

(因为是在虚拟机上进行的实验,当把虚拟机的物理网卡eth0添加到ovs上之后,虚拟机就连不上互联网了,也和host
失去了通信,原因是当把物理端口添加到虚拟交换机上之后,这些物理端口上原先的IP就会失效(Ip属于三层,交换机工作在
二层),无法与外界通信)
解决办法是添加一个类型为internal的端口,然后设置IP和路由
(使用ovs-vsctl del-port ovs-1 eth0 把虚拟机的物理网卡从ovs-1上删除之后都恢复正常了)


## 常用OVS操作
- 添加网桥：ovs-vsctl add-br 交换机名
- 删除网桥：ovs-vsctl del-br 交换机名
- 添加端口：ovs-vsctl add-port 交换机名 端口名（网卡名）
- 删除端口：ovs-vsctl del-port 交换机名 端口名（网卡名）
- 连接控制器：ovs-vsctl set-controller 交换机名 tcp:IP地址:端口号
- 断开控制器：ovs-vsctl del-controller 交换机名
- 列出所有网桥：ovs-vsctl list-br
- 列出网桥中的所有端口：ovs-vsctl list-ports 交换机名
- 列出所有挂接到网卡的网桥：ovs-vsctl port-to-br 端口名（网卡名）
- 查看open vswitch的网络状态：ovs-vsctl show
- 查看 Open vSwitch 中的端口信息（交换机对应的 dpid，以及每个端口的 OpenFlow 端口编号，端口名称，当前状态等等）：ovs-ofctl show 交换机名
- 修改dpid：ovs-vsctl set bridge 交换机名 other_config:datapath-id=新DPID
- 修改端口号：ovs-vsctl set Interface 端口名 ofport_request=新端口号
- 查看交换机中的所有 Table：ovs-ofctl dump-tables ovs-switch
- 查看交换机中的所有流表项：ovs−ofctl dump−flows ovs-switch
- 删除编号为 100 的端口上的所有流表项：ovs-ofctl del-flows ovs-switch "in_port=100"
- 添加流表项（以“添加新的 OpenFlow 条目，修改从端口 p0 收到的数据包的源地址为 9.181.137.1”为例）：
 ovs-ofctl add-flow ovs-switch "priority=1 idle_timeout=0,in_port=100,actions=mod_nw_src:9.181.137.1,normal"
（更多说明请查阅：《基于 Open vSwitch 的 OpenFlow 实践》）
- 查看 OVS 的版本信息：ovs-appctl --version
- 查看 OVS 支持的 OpenFlow 协议的版本：ovs-ofctl --version
