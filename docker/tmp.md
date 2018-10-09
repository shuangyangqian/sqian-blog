这个是我的osinos环境(test_tempest那个虚拟机是我自己创建的,可以忽略),sqian_net是我自己的私有网络.现在搞不明白这些网络的角色.

公网IP:也就是所谓的floating ip,作用是用来让外网环境访问这些虚拟机,简单点就是用来让我的笔记本可以ssh
登录到对应的虚拟机上. 这个floating ip和对应的虚拟机能不能上外网(互联网)有关系吗?如果不绑定这个公网IP那么对应的
虚拟机可以上互联网吗?

sqian_net:这个是jumpserver roller controller这些个虚拟机的租户网络,是不是说这几个虚拟机可以
使用sqian_net这个网络(192.168.0.xxx网段)来进行通信(但是我测试好像不行)

jumpserver上面为啥要绑定俩网卡,share_net这个网卡的作用是什么?

 1833-1835
 xvbLieA7KWFstAts
Uw7cvHmvNlL1KpX9
4_yeE78&5@6M
git fetch ssh://shuangyang.qian@review.easystack.cn:29418/easystack/ironic refs/changes/27/13127/1 && git cherry-pick FETCH_HEAD

[('/home/qsyqian/PycharmProjects/first_project/my_traceback.py', 19, '<module>', 'my_traceback()'),
 ('/home/qsyqian/PycharmProjects/first_project/my_traceback.py', 17, 'my_traceback', 'print traceback.extract_stack()')]



命令行不好使,查看publicurl地址,查看安全组是不是把该组件的端口打开.


charts

(Pdb) p methods[-1]
<VersionedMethod novaclient.v2.servers.[class Server(base.Resource):].evacuate>

参数错误状态:
(Pdb) p name
'novaclient.v2.servers.[None].evacuate'
(Pdb) p obj.api_version
<APIVersion: 2.37>


(Pdb) p methods
[<VersionedMethod novaclient.v2.servers.[None].evacuate>, <VersionedMethod novaclient.v2.servers.[None].evacuate>]
(Pdb) n
> /usr/lib/python2.7/site-packages/novaclient/api_versions.py(316)substitution()
-> return methods[-1].func(obj, *args, **kwargs)
(Pdb) p methods[-1]
<VersionedMethod novaclient.v2.servers.[None].evacuate>
(Pdb) p methods[-1].func()
*** TypeError: TypeError('evacuate() takes at least 2 arguments (0 given)',)
(Pdb) p methods[-1].func(obj, *args, **kwargs)
*** TypeError: TypeError('evacuate() takes at least 2 arguments (3 given)',)
(Pdb) p args
()
(Pdb) p kwargs
{'host': None, 'password': None}


(Pdb) p versioned_method
<VersionedMethod novaclient.v2.hypervisors.[None].list>
(Pdb) p start_version,
(<APIVersion: 2.0>,)
(Pdb) p start_version
<APIVersion: 2.0>
(Pdb) p end_version
<APIVersion: 2.32>
(Pdb) p func
<function list at 0x1b6cd70>
(Pdb) p name
'novaclient.v2.hypervisors.[None].list'



正常状态:
(Pdb) p name
'novaclient.v2.servers.[class Server(base.Resource):].evacuate'
(Pdb) p api_version
*** NameError: NameError("name 'api_version' is not defined",)
(Pdb) p obj.api_version
<APIVersion: 2.37>


(Pdb) n
> /usr/lib/python2.7/site-packages/novaclient/api_versions.py(316)substitution()
-> return methods[-1].func(obj, *args, **kwargs)
(Pdb) p methods[-1]
<VersionedMethod novaclient.v2.servers.[class Server(base.Resource):].evacuate>
(Pdb) p methods[-1].func()
*** TypeError: TypeError('evacuate() takes at least 1 argument (0 given)',)
(Pdb) p methods[-1].func(obj)
*** BadRequest: BadRequest()
(Pdb) p methods[-1].func(obj, *args, **kwargs)
*** BadRequest: BadRequest()
(Pdb) p args
()
(Pdb) p kwargs
{'host': None, 'password': None}
(Pdb)


newton版本再执行evacuate的时候报错:
# nova evacuate sqian node-2.domain.tld
ERROR (TypeError): evacuate() takes at least 2 arguments (3 given)"
但是把/novaclient/v2/servers.pyc文件反编译到servers.py就不会出现此问题
"# nova evacuate sqian node-2.domain.tld
ERROR (BadRequest): Compute service of node-1.domain.tld is still in use. (HTTP 400) (Request-ID: req-76152b04-2201-4c87-8b16-6340273b5de9)"




调试novaclient的时候遇到一个问题,不知道evacuate出问题是不是这里的问题.
大概就是获取evacuate函数的versioned-methodname的时候,如果把pyc文件反编译过来的话,得到的就是
(Pdb) p methods[-1]
<VersionedMethod novaclient.v2.servers.[class Server(base.Resource):].evacuate>
如果使用的是pyc文件的话,得到的是
(Pdb) p methods[-1]
<VersionedMethod novaclient.v2.servers.[None].evacuate>

中间的不同的地方是使用py文件的话能得到类的名字
而生成这个的是在api_version.py中的def _get_function_name函数中的这一行
filename, _lineno, _name, line = traceback.extract_stack()[-4]
其中的参数line就是对应的了类,也就是  class Server(base.Resource):

我研究了一下tracebak这个模块,写了个小程序测试了一下,发现如果只有pyc文件的话,line这个参数是读不出来内容,返回值为None的

我感觉如果能打印出类的名字的话,也就是可以打印出class Server  根据api-version的值,就可以准确定位到对应的Server类下的函数
如果打印不出来是不是找函数的时候找错了  因为novaclient.v2.servers.py这个函数中有两个类,一个是Server类,
一个是ServerManager类,我怀疑是不是找错函数了




max_userdata_limit


sudo route add default gw 192.168.1.1



__new__和__init__的区别
1.p = Person(name, age)
2.首先执行使用name和age参数来执行Person类的__new__方法，这个__new__方法会 返回Person类的一个实例
（通常情况下是使用 super(Persion, cls).__new__(cls, ... ...) 这样的方式）
3.然后利用这个实例来调用类的__init__方法，上一步里面__new__产生的实例也就是
 __init__里面的的 self
所以，__init__ 和 __new__ 最主要的区别在于：
1.__init__ 通常用于初始化一个新实例，控制这个初始化的过程，比如添加一些属性，
做一些额外的操作，发生在类实例被创建完以后。它是实例级别的方法。
2.__new__ 通常用于控制生成一个新实例的过程。它是类级别的方法。
但是说了这么多，__new__最通常的用法是什么呢，我们什么时候需要__new__？
__new__ 的作用
依照Python官方文档的说法，__new__方法主要是当你继承一些不可变的class时(比如int, str, tuple)，
提供给你一个自定义这些类的实例化过程的途径。还有就是实现自定义的metaclass。

如何查找一个文件中的字符串有多少个
或者替换特定的字符串

高可用ha原理

快速排序

Python多线程(**)
thread和threading


sort函数的实现
Timsort是结合了合并排序（merge sort）和插入排序（insertion sort）而得出的排序算法，
它在现实中有很好的效率。Tim Peters在2002年设计了该算法并在Python中使用（TimSort
是 Python 中 list.sort 的默认实现）。该算法找到数据中已经排好序的块-分区，
每一个分区叫一个run，然后按规则合并这些run。Pyhton自从2.3版以来一直采用Timsort算法排序，
现在Java SE7和Android也采用Timsort算法对数组排序。

给两个list,合并且排序

字典的一些特性
字典是无序的,不能够通过偏移来取值,只能通过键来取其value的值
字典可嵌套,方便组织多种数据结构
字典的键必须是不可变的数据类型,如数字,字符串,元祖等,但是list等可变数据类型不可为key


生成器和迭代器的区别
迭代器是一种支持next()操作的对象。它包含一组元素，当执行next()操作时，
返回其中一个元素；当所有元素都被返回后，生成一个StopIteration异常。
生成器是一种迭代器，是一种特殊的函数，使用yield操作将函数构造成迭代器。
普通的函数有一个入口，有一个返回值；当函数被调用时，从入口开始执行，
结束时返回相应的返回值。生成器定义的函数，有多个入口和多个返回值；
对生成器执行next()操作，进行生成器的入口开始执行代码，yield操作
向调用者返回一个值，并将函数挂起；挂起时，函数执行的环境和参数被保存下来；
对生成器执行另一个next()操作时，参数从挂起状态被重新调用，进入上次挂起
的执行环境继续下面的操作，到下一个yield操作时重复上面的过程。P
ython的循环操作与C语言的实现不同，如果使用List等数据结构需要耗费大量的内容；
循环操作中使用生成器只需要在内存中实例化一个对象，可以减少内存占用，提高循环操作的执行速度。

生成器和迭代器
装饰器原理  装饰器是在什么时候被加载的
线程和进程  怎么选择
元类 metaclass
静态方法
