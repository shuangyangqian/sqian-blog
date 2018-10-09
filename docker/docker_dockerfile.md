### dockerfile是用来构建docker镜像的一种比较靠谱的方法，学习dockerfile对docker镜像的理解很有帮助。

dockerfile中主要是包含了一些命令，掌握了这些基本命令的用法，加以理解，对dockerfile的理解自然很容易。采用命令、命令含义、命令用法、举例说明的格式加以介绍。


##### FROM

指定基础镜像，每一个镜像都要从一个基础镜像定制而来，因此FROM命令基本上每一个dockerfile中都会使用到。基础镜像可以实用官方提供的比如nginx、centos、ubuntu、tomcat等等，也可以是自己打造的符合自己需求的镜像。

eg：

	FROM centos
		

特例：一些镜像不需要基础镜像，比如swarm、coreos/etcd等。这些镜像在构建的时候可以直接指定 `FROM scratch `,表示不使用基础镜像，第一条命令是镜像的第一层。一些GOLANG开发的程序也是这种场景应用的例子。


##### RUN

RUN是用来执行命令的，RUN在构建docker镜像的时候是比较常见的。格式有两种：

- shell格式：就像直接在命令行执行命令一样

	RUN echo '<h1\>Hello, Docker!</h1\>' > /usr/share/nginx/html/index.html


- exec格式：`RUN ["可执行文件"， "参数1"， "参数2"] `，更像是函数调用的方式。

既然RUN命令可以像shell脚本那样执行命令，是不是可以一条命令写一个RUN，其实不然，在构建镜像的时候执行一条命令表示在上面增加一层。所以为了使我们的镜像尽量小，我们需要把好几个功能类似的RUN命令合并成一个，并且在执行过程中要注意删除一些缓存和安装包等一些最终不需要的文件。举个例子：


	FROM debian:jessie
	RUN buildDeps='gcc libc6-dev make' \
	&& apt-get update \
	&& apt-get install -y $buildDeps \
	&& wget -O redis.tar.gz "http://download.redis.io/releases/redis-3.2.5.tar.gz" \
	&& mkdir -p /usr/src/redis \
	&& tar -xzf redis.tar.gz -C /usr/src/redis --strip-components=1 \
	&& make -C /usr/src/redis \
	&& make -C /usr/src/redis install \
	&& rm -rf /var/lib/apt/lists/* \
	&& rm redis.tar.gz \
	&& rm -r /usr/src/redis \
	&& apt-get purge -y --auto-remove $buildDeps

上述RUN命令就是为了安装和编译redis，所以可以合并到一起。并且要删除.tar.gz等一些不需要的文件。


##### COPY

顾名思义，复制文件的作用。有两种使用方法：

- COPY <原路径> ...  <目标路径>
- COPY ["<原路径1>", ... "<目标路径>"]

举例：


	COPY package.json /usr/src/app/
	COPY hom* /mydir/
	COPY hom?.txt /mydir/

上述例子中，源文件可以使一个具体的文件，也可以是一个目录，目录可以使用通配符来匹配。目标路径可以使容器内部的绝对路径，也可以是相对于工作目录的相对路径，工作目录由workdir来决定。目标路径不需要提前创建，如果没有，会自动创建。


##### ADD

相比较COPY更加高级的复制文件命令。ADD和COPY的功能基本上是一致的，但是在COPY的基础上增加了一些更加强大的功能。比如源文件可以使一个url，ADD会从这个URL下载文件拷贝到容器内，并赋予600的权限。

当源文件是一个tar包，并且压缩格式是gzip、bzip2以及xz的时候，ADD会自动把压缩包解压到对应的目标路径中去。但是某些时候不需要解压，只希望把压缩包复制过去，就不能使用ADD了，必须要使用COPY。

此外ADD在构建镜像的时候可能会导致缓存失效，导致构建比较缓慢或者失败。

因此COPY和ADD在使用过程中，所有文件的复制均使用COPY，仅仅是需要自动解压的时候才使用ADD。

##### CMD

容器启动命令。也有两种使用方法：

- shell 格式： CMD <命令>
- exec 格式： CMD ["可执行文件", "参数1", "参数2"...]
- 参数列表格式： CMD ["参数1", "参数2"...] 。在指定了 ENTRYPOINT 指令后，用 CMD 指
定具体的参数


容器和虚拟机的区别就是容器是一个进程，容器启动的时候需要有一个进程来在前端执行。不想虚拟机一样可以在虚拟机内部后天运行多个进程。那么容器在启动的时候就需要指定进程的命令和参数，CMD就是来干这事的。

在运行时可以指定新的命令来替代镜像设置中的这个默认命令，比如， ubuntu 镜像默认的
CMD 是 /bin/bash ，如果我们直接 docker run -it ubuntu 的话，会直接进入 bash 。我们
也可以在运行时指定运行别的命令，如 docker run -it ubuntu cat /etc/os-release 。这就是
用 cat /etc/os-release 命令替换了默认的 /bin/bash 命令了，输出了系统版本信息。

在指令格式上推荐使用exec的格式，这类格式在解析的时候会被解析成json，因此在使用的时候要用双引号，不能够使用单引号。

如果使用了shell格式，那么实际上在执行过程中也会被转换成exec的格式来执行。如：

	CMD echo $HOME


实际上在执行的过程中会被转换成sh -c的格式，如下：


	CMD [ "sh", "-c", "echo $HOME" ]


继续上面的容器和虚拟机的区别，容器是一个进程，和虚拟机不同的是不能够使用systemd等系统后台进程来管理。有些同学在写CMD的时候会写：


	CMD service nginx start


发现容器执行完就退出了。甚至去容器内部执行systemctl来查看服务状态，发现根本执行不了。这还是停留在使用虚拟机的思维来学习容器。

对于容器而言，其启动程序就是容器的应用进程，容器就是为了主进程而存在的。一旦主进程退出了，容器自然也会退出。而上述` CMD service nginx start` 命令会被解析成 ` CMD ["sh", "-c ", "service nginx start"] `, 因此主进程实际上是sh。那么当service nginx start进程结束后，sh也就结束了，sh结束了，容器自然也就退出了。

因此上述命令正确的用法就是：

	CMD ["nginx", "-g", "daemon off;"]


##### ENDPOINT

入口点。ENDPOINT和CMD一样，都是为了指定容器运行的主程序。当制定了ENDPOINT的时候，CMD的含义就发生了改变，不再是直接执行其命令，而是将CMD的内容作为参数传递给ENDPOINT，如下：


	<ENDPOINT> "<CMD>"


我们来看几种使用ENDPOINT的场景。

###### 让镜像编程像命令一样使用

假设我们需要一个得知自己公网IP的镜像，那么可以先用CMD来实现：

	FROM ubuntu:16.04
	RUN apt-get update \
	&& apt-get install -y curl \
	&& rm -rf /var/lib/apt/lists/*
	CMD [ "curl", "-s", "http://ip.cn" ]


假如使用` docker build -t myip .`来构建镜像，那么我们可以使用下述命令来得知当前IP：


	$ docker run myip
	当前 IP：61.148.226.66 来自：北京市 联通


上述已基本上把镜像当命令来使用了。不过命令总有参数，比如上述实际上是执行了curl命令，加入我们需要加-i -v等参数，是否可以直接加呢？



	$ docker run myip -i
	docker: Error response from daemon: invalid header field value "oci runtime error: con
	tainer_linux.go:247: starting container process caused \"exec: \\\"-i\\\": executable
	file not found in $PATH\"\n".


可以看到是不行的。实际上上述是使用-i替换了原来的CMD，而不是加在了原来的curl -s http://ip.cn后面，因为-i不是一个可执行文件，所以报错为executable file not found的错误。

如果我们需要添加-i参数，就必须要完成输入命令：


	docker run myip curl -s http://ip.cn -i

这显然不是最好的解决方案，使用ENDPOINT就可以解决上述问题。

比如我们重新来构建这个镜像：



	FROM ubuntu:16.04
	RUN apt-get update \
	&& apt-get install -y curl \
	&& rm -rf /var/lib/apt/lists/*
	ENTRYPOINT [ "curl", "-s", "http://ip.cn" ]

再次尝试使用` docker run myip -i`， 可以得到：


	$ docker run myip
	当前 IP：61.148.226.66 来自：北京市 联通
	$ docker run myip -i
	HTTP/1.1 200 OK
	Server: nginx/1.8.0
	Date: Tue, 22 Nov 2016 05:12:40 GMT
	Content-Type: text/html; charset=UTF-8
	Vary: Accept-Encoding
	X-Powered-By: PHP/5.6.24-1~dotdeb+7.1
	X-Cache: MISS from cache-2
	X-Cache-Lookup: MISS from cache-2:80
	X-Cache: MISS from proxy-2_6
	Transfer-Encoding: chunked
	Via: 1.1 cache-2:80, 1.1 proxy-2_6:8006
	Connection: keep-alive	
	当前 IP：61.148.226.66 来自：北京市 联通

可以看到这次成功了。这是因为当存在ENDPOINT的时候，CMD的内容会作为参数传递给ENDPOINT，而这里的-i是新的CMD，因此会作为参数传给curl，从而达到了我们的效果。


###### 应用运行前的准备工作

启动容器就是启动一个主进程，而往往主进程启动之前需要一些配置工作，如mysql的初始化等等。

这些准备工作是和CMD无关的，无论CMD为什么都要事先进行一些预处理工作。这种情况可以将这些预处理的工作写成一个脚本，放到ENDPOINT中去执行，这个脚本会将接到的参数（也就是CMD的内容）作为命令，放到脚本的最后边去执行，比如官方的redis镜像就是这么做的：


	FROM alpine:3.4
	...
	RUN addgroup -S redis && adduser -S -G redis redis
	...
	ENTRYPOINT ["docker-entrypoint.sh"]
	EXPOSE 6379
	CMD [ "redis-server" ]

可以看到其中为redis服务创建了redis用户，并最后指定了docker-entrypoint.sh的脚本



	#!/bin/sh
	...
	# allow the container to be started with `--user`
	if [ "$1" = 'redis-server' -a "$(id -u)" = '0' ]; then
	chown -R redis .
	exec su-exec redis "$0" "$@"
	fi
	exec "$@"
	

该脚本的内容就是根据CMD的内容来判断，如果是redis-server的话，则切换到redis用户身份来启动服务器，否则依旧使用root来执行。比如：


	$ docker run -it redis id
	uid=0(root) gid=0(root) groups=0(root)

##### ENV

设置环境变量。有两种格式：

- ENV <key> <value>
- ENV <key1>=<value1> <key2>=<value2>

这个命令比较简单，就是设置环境变量。其后的一些命令，比如RUN等都可以使用该命令指定的环境变量值。

##### ARG

构建参数。格式

	
	ARG <参数名>[=<默认值>]


ARG和ENV的效果是一样的，都是设置环境变量。不同的是ARG设置的环境变量最终在容器中是不存在的。但是不要因此就是用ARG来保存一些密码等信息，因为使用docker history都可以查看到。

Dockerfile 中的 ARG 指令是定义参数名称，以及定义其默认值。该默认值可以在构建命令
docker build 中用 --build-arg <参数名>=<值> 来覆盖。

在 1.13 之前的版本，要求 --build-arg 中的参数名，必须在 Dockerfile 中用 ARG 定义过
了，换句话说，就是 --build-arg 指定的参数，必须在 Dockerfile 中使用了。如果对应参
数没有被使用，则会报错退出构建。从 1.13 开始，这种严格的限制被放开，不再报错退出，
而是显示警告信息，并继续构建。这对于使用 CI 系统，用同样的构建流程构建不同的
Dockerfile 的时候比较有帮助，避免构建命令必须根据每个 Dockerfile 的内容修改。


##### VOLUME

定义匿名卷。格式为：

- VOLUME ["路径1", "路径2", ...]
- VOLUME <路径>


之前我们说过，容器运行时应该尽量保持容器存储层不发生写操作，对于数据库类需要保存
动态数据的应用，其数据库文件应该保存于卷(volume)中，后面的章节我们会进一步介绍
Docker 卷的概念。为了防止运行时用户忘记将动态文件所保存目录挂载为卷，在
Dockerfile 中，我们可以事先指定某些目录挂载为匿名卷，这样在运行时如果用户不指定挂
载，其应用也可以正常运行，不会向容器存储层写入大量数据。

	VOLUME /data

这里的 /data 目录就会在运行时自动挂载为匿名卷，任何向 /data 中写入的信息都不会记
录进容器存储层，从而保证了容器存储层的无状态化。当然，运行时可以覆盖这个挂载设
置。比如：

docker run -d -v mydata:/data xxxx


在这行命令中，就使用了 mydata 这个命名卷挂载到了 /data 这个位置，替代了
Dockerfile 中定义的匿名卷的挂载配置。

##### EXPOSE

声明端口。格式为：

- EXPOSE <端口1> [<端口2> ...]

EXPOSE 指令是声明运行时容器提供服务端口，这只是一个声明，在运行时并不会因为这个声
明应用就会开启这个端口的服务。在 Dockerfile 中写入这样的声明有两个好处，一个是帮助
镜像使用者理解这个镜像服务的守护端口，以方便配置映射；另一个用处则是在运行时使用
随机端口映射时，也就是 docker run -P 时，会自动随机映射 EXPOSE 的端口。


此外，在早期 Docker 版本中还有一个特殊的用处。以前所有容器都运行于默认桥接网络中，
因此所有容器互相之间都可以直接访问，这样存在一定的安全性问题。于是有了一个 Docker
引擎参数 --icc=false ，当指定该参数后，容器间将默认无法互访，除非互相间使用了 --
links 参数的容器才可以互通，并且只有镜像中 EXPOSE 所声明的端口才可以被访问。这个
--icc=false 的用法，在引入了 docker network 后已经基本不用了，通过自定义网络可以很
轻松的实现容器间的互联与隔离。


要将 EXPOSE 和在运行时使用 -p <宿主端口>:<容器端口> 区分开来。 -p ，是映射宿主端口和
容器端口，换句话说，就是将容器的对应端口服务公开给外界访问，而 EXPOSE 仅仅是声明
容器打算使用什么端口而已，并不会自动在宿主进行端口映射。

##### WORKDIR

指定工作目录。格式为

- WORKDIR <工作目录路径>

使用 WORKDIR 指令可以来指定工作目录（或者称为当前目录） ，以后各层的当前目录就被改
为指定的目录，如该目录不存在， WORKDIR 会帮你建立目录。


之前提到一些初学者常犯的错误是把 Dockerfile 等同于 Shell 脚本来书写，这种错误的理解
还可能会导致出现下面这样的错误：


	RUN cd /app
	RUN echo "hello" > world.txt

如果将这个 Dockerfile 进行构建镜像运行后，会发现找不到 /app/world.txt 文件，或者其
内容不是 hello 。原因其实很简单，在 Shell 中，连续两行是同一个进程执行环境，因此前
一个命令修改的内存状态，会直接影响后一个命令；而在 Dockerfile 中，这两行 RUN 命令
的执行环境根本不同，是两个完全不同的容器。这就是对 Dockerfile 构建分层存储的概念
不了解所导致的错误。

之前说过每一个 RUN 都是启动一个容器、执行命令、然后提交存储层文件变更。第一层 RUN
cd /app 的执行仅仅是当前进程的工作目录变更，一个内存上的变化而已，其结果不会造成任
何文件变更。而到第二层的时候，启动的是一个全新的容器，跟第一层的容器更完全没关
系，自然不可能继承前一层构建过程中的内存变化。

因此如果需要改变以后各层的工作目录的位置，那么应该使用 WORKDIR 指令。

##### USER

制定当前用户。格式为：

- USER 用户名


USER 指令和 WORKDIR 相似，都是改变环境状态并影响以后的层。 WORKDIR 是改变工作目
录， USER 则是改变之后层的执行 RUN , CMD 以及 ENTRYPOINT 这类命令的身份。

当然，和 WORKDIR 一样， USER 只是帮助你切换到指定用户而已，这个用户必须是事先建立
好的，否则无法切换。


	RUN groupadd -r redis && useradd -r -g redis redis
	USER redis
	RUN [ "redis-server" ]

如果以 root 执行的脚本，在执行期间希望改变身份，比如希望以某个已经建立好的用户来
运行某个服务进程，不要使用 su 或者 sudo ，这些都需要比较麻烦的配置，而且在 TTY 缺
失的环境下经常出错。建议使用 gosu 。


	# 建立 redis 用户，并使用 gosu 换另一个用户执行命令
	RUN groupadd -r redis && useradd -r -g redis redis
	# 下载 gosu
	RUN wget -O /usr/local/bin/gosu "https://github.com/tianon/gosu/releases/download/1.7/
	gosu-amd64" \
	&& chmod +x /usr/local/bin/gosu \
	&& gosu nobody true
	# 设置 CMD，并以另外的用户执行
	CMD [ "exec", "gosu", "redis", "redis-server" ]

##### HEALTHCHECK

健康检查。格式为：

- HEALTHCHECK [选项] CMD <命令> :设置检查容器健康状态的命令
- HEALTHCHECK NONE :如果基础镜像有健康检查命令，使用这一行可以屏蔽掉其健康检查命令。


HEALTHCHECK 指令是告诉 Docker 应该如何进行判断容器的状态是否正常，这是 Docker 1.12
引入的新指令。


在没有 HEALTHCHECK 指令前，Docker 引擎只可以通过容器内主进程是否退出来判断容器是否
状态异常。很多情况下这没问题，但是如果程序进入死锁状态，或者死循环状态，应用进程
并不退出，但是该容器已经无法提供服务了。在 1.12 以前，Docker 不会检测到容器的这种
状态，从而不会重新调度，导致可能会有部分容器已经无法提供服务了却还在接受用户请
求。


而自 1.12 之后，Docker 提供了 HEALTHCHECK 指令，通过该指令指定一行命令，用这行命令
来判断容器主进程的服务状态是否还正常，从而比较真实的反应容器实际状态。
当在一个镜像指定了 HEALTHCHECK 指令后，用其启动容器，初始状态会为 starting ，在
HEALTHCHECK 指令检查成功后变为 healthy ，如果连续一定次数失败，则会变为
unhealthy 。

HEALTHCHECK 一般有以下几个参数

- --interval=<间隔> ：两次健康检查的间隔，默认为 30 秒；
- --timeout=<时长> ：健康检查命令运行超时时间，如果超过这个时间，本次健康检查就被
视为失败，默认 30 秒；
- --retries=<次数> ：当连续失败指定次数后，则将容器状态视为 unhealthy ，默认 3
次。

和 CMD , ENTRYPOINT 一样， HEALTHCHECK 只可以出现一次，如果写了多个，只有最后一个生
效。

在 HEALTHCHECK [选项] CMD 后面的命令，格式和 ENTRYPOINT 一样，分为 shell 格式，和
exec 格式。命令的返回值决定了该次健康检查的成功与否： 0 ：成功； 1 ：失败； 2 ：
保留，不要使用这个值。

假设我们有个镜像是个最简单的 Web 服务，我们希望增加健康检查来判断其 Web 服务是否
在正常工作，我们可以用 curl 来帮助判断，其 Dockerfile 的 HEALTHCHECK 可以这么写：


	FROM nginx
	RUN apt-get update && apt-get install -y curl && rm -rf /var/lib/apt/lists/*
	HEALTHCHECK --interval=5s --timeout=3s \
	CMD curl -fs http://localhost/ || exit 1


这里我们设置了每 5 秒检查一次（这里为了试验所以间隔非常短，实际应该相对较长） ，如
果健康检查命令超过 3 秒没响应就视为失败，并且使用 curl -fs http://localhost/ || exit
1 作为健康检查命令。


使用 docker build 来构建这个镜像：


	$ docker build -t myweb:v1 .

构建好了后，我们启动一个容器：


	$ docker run -d --name web -p 80:80 myweb:v1

当运行该镜像后，可以通过 docker container ls 看到最初的状态为 (health: starting) ：


	$ docker container ls
	CONTAINER ID IMAGE COMMAND CREATED S
	TATUS PORTS NAMES
	03e28eb00bd0 myweb:v1 "nginx -g 'daemon off" 3 seconds ago U
	p 2 seconds (health: starting) 80/tcp, 443/tcp web


在等待几秒钟后，再次 docker container ls ，就会看到健康状态变化为了 (healthy) ：


	$ docker container ls
	CONTAINER ID IMAGE COMMAND CREATED S
	TATUS PORTS NAMES
	03e28eb00bd0 myweb:v1 "nginx -g 'daemon off" 18 seconds ago U
	p 16 seconds (healthy) 80/tcp, 443/tcp web

如果健康检查连续失败超过了重试次数，状态就会变为 (unhealthy) 。

为了帮助排障，健康检查命令的输出（包括 stdout 以及 stderr ） 都会被存储于健康状态
里，可以用 docker inspect 来查看。


	$ docker inspect --format '{{json .State.Health}}' web | python -m json.tool
	{
		"FailingStreak": 0,
		"Log": [
		{
	"End": "2016-11-25T14:35:37.940957051Z",
	"ExitCode": 0,
	"Output": "<!DOCTYPE html>\n<html>\n<head>\n<title>Welcome to nginx!</title>\n<style>\n body {\n width: 35em;\n margin: 0 auto;\n font-family: Tahoma, Verdana, Arial, sans-serif;\n }\n</style>\n</head>\n<body>\n<h1>Welcome to nginx!</h1>\n<p>If you see this page, the nginx web server is successfully installed and\nworking. Further configuration is required.</p>\n\n<p>For online documentation and support please refer to\n<a href=\"http://nginx.org/\">nginx.org</a>.<br/>\nCommercial support is available at\n<a href=\"http://nginx.com/\">nginx.com</a>.</p>\n\n<p><em>Thank you for using nginx.</em></p>\n</body>\n</html>\n","Start": "2016-11-25T14:35:37.780192565Z"
		}
	],
	"Status": "healthy"
	}



##### ONBUILD

为他人做嫁衣。格式为：

- ONBUILD <其他命令>

ONBUILD 是一个特殊的指令，它后面跟的是其它指令，比如 RUN , COPY 等，而这些指令，
在当前镜像构建时并不会被执行。只有当以当前镜像为基础镜像，去构建下一级镜像的时候
才会被执行。

Dockerfile 中的其它指令都是为了定制当前镜像而准备的，唯有 ONBUILD 是为了帮助别人
定制自己而准备的。
假设我们要制作 Node.js 所写的应用的镜像。我们都知道 Node.js 使用 npm 进行包管理，所
有依赖、配置、启动信息等会放到 package.json 文件里。在拿到程序代码后，需要先进行
npm install 才可以获得所有需要的依赖。然后就可以通过 npm start 来启动应用。因此，
一般来说会这样写 Dockerfile ：



	FROM node:slim
	RUN mkdir /app
	WORKDIR /app
	COPY ./package.json /app
	RUN [ "npm", "install" ]
	COPY . /app/
	CMD [ "npm", "start" ]


把这个 Dockerfile 放到 Node.js 项目的根目录，构建好镜像后，就可以直接拿来启动容器运
行。但是如果我们还有第二个 Node.js 项目也差不多呢？好吧，那就再把这个 Dockerfile 复
制到第二个项目里。那如果有第三个项目呢？再复制么？文件的副本越多，版本控制就越困
难，让我们继续看这样的场景维护的问题。


如果第一个 Node.js 项目在开发过程中，发现这个 Dockerfile 里存在问题，比如敲错字了、
或者需要安装额外的包，然后开发人员修复了这个 Dockerfile ，再次构建，问题解决。第一
个项目没问题了，但是第二个项目呢？虽然最初 Dockerfile 是复制、粘贴自第一个项目
的，但是并不会因为第一个项目修复了他们的 Dockerfile ，而第二个项目的 Dockerfile 就
会被自动修复。


那么我们可不可以做一个基础镜像，然后各个项目使用这个基础镜像呢？这样基础镜像更
新，各个项目不用同步 Dockerfile 的变化，重新构建后就继承了基础镜像的更新？好吧，
可以，让我们看看这样的结果。那么上面的这个 Dockerfile 就会变为：


	FROM node:slim
	RUN mkdir /app
	WORKDIR /app
	CMD [ "npm", "start" ]

这里我们把项目相关的构建指令拿出来，放到子项目里去。假设这个基础镜像的名字为 mynode 的话，各个项目内的自己的 Dockerfile 就变为：


	FROM my-node
	COPY ./package.json /app
	RUN [ "npm", "install" ]
	COPY . /app/

基础镜像变化后，各个项目都用这个 Dockerfile 重新构建镜像，会继承基础镜像的更新。
那么，问题解决了么？没有。准确说，只解决了一半。如果这个 Dockerfile 里面有些东西
需要调整呢？比如 npm install 都需要加一些参数，那怎么办？这一行 RUN 是不可能放入
基础镜像的，因为涉及到了当前项目的 ./package.json ，难道又要一个个修改么？所以说，
这样制作基础镜像，只解决了原来的 Dockerfile 的前4条指令的变化问题，而后面三条指令
的变化则完全没办法处理。


ONBUILD 可以解决这个问题。让我们用 ONBUILD 重新写一下基础镜像的 Dockerfile :


	FROM node:slim
	RUN mkdir /app
	WORKDIR /app
	ONBUILD COPY ./package.json /app
	ONBUILD RUN [ "npm", "install" ]
	ONBUILD COPY . /app/
	CMD [ "npm", "start" ]

这次我们回到原始的 Dockerfile ，但是这次将项目相关的指令加上 ONBUILD ，这样在构建
基础镜像的时候，这三行并不会被执行。然后各个项目的 Dockerfile 就变成了简单地：


	FROM my-node

是的， 只有这一行。当在各个项目目录中，用这个只有一行的 Dockerfile 构建镜像时，
之前基础镜像的那三行 ONBUILD 就会开始执行，成功的将当前项目的代码复制进镜像、并且
针对本项目执行 npm install ，生成应用镜像。

