FROM
指定 base 镜像。

MAINTAINER
设置镜像的作者，可以是任意字符串。

COPY
将文件从 build context 复制到镜像。

COPY 支持两种形式：
    COPY src dest
    COPY ["src", "dest"]
        注意：src 只能指定 build context 中的文件或目录。

ADD
与 COPY 类似，从 build context 复制文件到镜像。不同的是，如果 src 是归档文件（tar, zip, tgz, xz 等），文件会被自动解压到 dest。

ENV
设置环境变量，环境变量可被后面的指令使用。例如：
...
ENV MY_VERSION 1.3
RUN apt-get install -y mypackage=$MY_VERSION
...

EXPOSE
指定容器中的进程会监听某个端口，Docker 可以将该端口暴露出来。我们会在容器网络部分详细讨论。

VOLUME
将文件或目录声明为 volume。我们会在容器存储部分详细讨论。

WORKDIR
为后面的 RUN, CMD, ENTRYPOINT, ADD 或 COPY 指令设置镜像中的当前工作目录。

RUN
在容器中运行指定的命令。

CMD
容器启动时运行指定的命令。
Dockerfile 中可以有多个 CMD 指令，但只有最后一个生效。CMD 可以被 docker run 之后的参数替换。

ENTRYPOINT
设置容器启动时运行的命令。
Dockerfile 中可以有多个 ENTRYPOINT 指令，但只有最后一个生效。
CMD 或 docker run 之后的参数会被当做参数传递给 ENTRYPOINT。





最佳实践:
1:使用 RUN 指令安装应用和软件包，构建镜像。
2:如果 Docker 镜像的用途是运行应用程序或服务，
比如运行一个 MySQL，应该优先使用 Exec 格式的 ENTRYPOINT 指令。
CMD 可为 ENTRYPOINT 提供额外的默认参数，同时可利用 docker run 命令行替换默认参数。
3:如果想为容器设置默认的启动命令，可使用 CMD 指令。用户可在 docker run 命令行中替换此默认命令。
  到这里，我们已经具备编写 Dockerfile 的能力了。如果大家还觉得没把握，
  推荐一个快速掌握 Dockerfile 的方法：去 Docker Hub 上参考那些官方镜像的 Dockerfile。
