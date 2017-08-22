# openstack tempest简介 #

项目地址：[https://github.com/openstack/tempest/](https://github.com/openstack/tempest/)

tempest文档地址：[https://docs.openstack.org/tempest/latest/](https://docs.openstack.org/tempest/latest/)


tempest是针对正在运行的一个openstack集群的一系列集成测试。通过对openstack的API验证，不同情形，不同测试点来进行测试，在验证openstack部署的有效性方面具有很好的效果。

## 设计准则： ##
tempest极力追求以下设计准则：



1. Tempest可以在任何规模的openstack cloud上运行，包括devstack安装的单节点，20歌节点的LXC cloud，1000个节点的KVM cloud。
2. Tempest在测试功能上是十分明确的，往往很难正确发现云的完整功能，或者对一个云的功能做出正确的评估。但是，准确总是更好的。
3. Tempest用的是openstack的公共接口，在tempest中的测试只涉及openstack的公共API接口。
4. Tempest不应该涉及私有的和特殊的接口。也就是不能直接访问数据库，不能直接调用底层hypervisor，不测试不包含在openstack基本库中的功能。
5. Tempest追求完全覆盖openstack的API和那些验证一个正在工作的云的所有情形。
6. Tempest在测试完成之后会释放所创建的资源。
7. Tempest应当被设计为自测。
