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


## Tempest Field Guide to API tests ##

**What are these tests?**

One of Tempest's prime function is to ensure that your OpenStack cloud works with the OpenStack API as documented. The current largest portion of Tempest code is devoted to test cases that do exactly this.

It's also important to test not only the expected positive path on APIs, but also to provide them with invalid data to ensure they fail in expected and documented ways. The latter type of tests is called negative tests in Tempest source code. Over the course of the OpenStack project Tempest has discovered many fundamental bugs by doing just this.

In order for some APIs to return meaningful results, there must be enough data in the system. This means these tests might start by spinning up a server, image, etc, then operating on it.

**Why are these tests in Tempest?**

This is one of the core missions for the Tempest project, and where it started. Many people use this bit of function in Tempest to ensure their clouds haven't broken the OpenStack API.

It could be argued that some of the negative testing could be done back in the projects themselves, and we might evolve there over time, but currently in the OpenStack gate this is a fundamentally important place to keep things.

**Scope of these tests**

API tests should always use the Tempest implementation of the OpenStack API, as we want to ensure that bugs aren't hidden by the official clients.

They should test specific API calls, and can build up complex state if it's needed for the API call to be meaningful.

They should send not only good data, but bad data at the API and look for error codes.

They should all be able to be run on their own, not depending on the state created by a previous test.


## Tempest Field Guide to Scenario tests ##
  

**What are these tests?**

Scenario tests are "through path" tests of OpenStack function. Complicated setups where one part might depend on completion of a previous part. They ideally involve the integration between multiple OpenStack services to exercise the touch points between them.

Any scenario test should have a real-life use case. An example would be:

"As operator I want to start with a blank environment":
upload a glance image
deploy a vm from it
ssh to the guest
create a snapshot of the vm

**Why are these tests in Tempest?**

This is one of Tempest's core purposes, testing the integration between projects.

**Scope of these tests**

Scenario tests should always use the Tempest implementation of the OpenStack API, as we want to ensure that bugs aren't hidden by the official clients.

Tests should be tagged with which services they exercise, as determined by which client libraries are used directly by the test.

**Example of a good test**

While we are looking for interaction of 2 or more services, be specific in your interactions. A giant "this is my data center" smoke test is hard to debug when it goes wrong.

A flow of interactions between Glance and Nova, like in the introduction, is a good example. Especially if it involves a repeated interaction when a resource is setup, modified, detached, and then reused later again.

## Tempest Field Guide to Unit tests ##
  
**What are these tests?**

Unit tests are the self checks for Tempest. They provide functional verification and regression checking for the internal components of Tempest. They should be used to just verify that the individual pieces of Tempest are working as expected. They should not require an external service to be running and should be able to run solely from the Tempest tree.

**Why are these tests in Tempest?**

These tests exist to make sure that the mechanisms that we use inside of Tempest are valid and remain functional. They are only here for self validation of Tempest.

**Scope of these tests**

Unit tests should not require an external service to be running or any extra configuration to run. Any state that is required for a test should either be mocked out or created in a temporary test directory. (see test_wrappers.py for an example of using a temporary test directory)