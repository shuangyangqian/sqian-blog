FYI:
https://www.cnblogs.com/metoy/p/4320813.html

iptables -t 表名 <-A/I/D/R> 规则链名 [规则号] <-i/o 网卡名> -p 协议名 <-s 源IP/源子网> --sport 源端口 <-d 目标IP/目标子网> --dport 目标端口 -j 动作

iptables -t nat -I PREROUTING  -d 192.168.111.39/32 -p tcp -m tcp --dport 80  -j DNAT --to-destination  172.16.10.2
iptables -t nat -I POSTROUTING -d 172.16.10.2/32    -p tcp -m tcp --dport 80  -j SNAT --to-source       172.16.10.1
iptables -t nat -I PREROUTING  -d 192.168.111.39/32 -p tcp -m tcp --dport 443 -j DNAT --to-destination  172.16.10.2
iptables -t nat -I POSTROUTING -d 172.16.10.2/32    -p tcp -m tcp --dport 443 -j SNAT --to-source       172.16.10.1
