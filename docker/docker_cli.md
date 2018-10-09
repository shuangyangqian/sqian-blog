# 从镜像运行容器,并且保持容器运行,登录到容器系统内部:
	#docker run -it $image_name --name $docker_name

# 查看所有容器列表,-a表示列出运行的和不运行的的
	#docker ps -a

# 查看镜像列表
	#docker images

# 查看docker服务的所有信息
	#docker info

# 将容器导出为镜像
	#docker commit $docker_name $new_image_name

# 会显示镜像的构建历史，也就是 Dockerfile 的执行过程。
	#docker history

# docker tag命令方便地给镜像打 tag。
	#docker tag myimage-v1.9.1 myimage:1
	#docker tag myimage-v1.9.1 myimage:1.9
	#docker tag myimage-v1.9.1 myimage:1.9.1
	#docker tag myimage-v1.9.1 myimage:latest

# docker关于镜像经常使用的一些子命令
	images    	显示镜像列表
	history   	显示镜像构建历史
	commit    	从容器创建新镜像
	build     	从 Dockerfile 构建镜像
	tag       	给镜像打 tag
	pull      	从 registry 下载镜像
	push      	将 镜像 上传到 registry
	rmi       	删除 Docker host 中的镜像
	search    	搜索 Docker Hub 中的镜像
	create      创建容器
	run         运行容器
	pause       暂停容器
	unpause     取消暂停继续运行容器
	stop        发送 SIGTERM 停止容器
	kill        发送 SIGKILL 快速停止容器
	start       启动容器
	restart     重启容器
	attach      attach 到容器启动进程的终端
	exec        在容器中启动新进程，通常使用 "-it" 参数
	logs        显示容器启动进程的控制台输出，用 "-f" 持续打印
	rm          从磁盘中删除容器

# 批量删除状态已经推出的容器:
	docker rm -v $(docker ps -aq -f status=exited)

# 批量删除镜像
	docker rmi $(docker images -q)



# 使用dockerfile来创建镜像:
	
1. 当前目录为 /root。
2. Dockerfile 准备就绪。
3. #docker build -t centos-with-vim-dockerfile .
4. 运行 docker build 命令，-t 将新镜像命名为 ubuntu-with-vi-dockerfile，命令末尾的 . 指明build context 为当前目录。Docker 默认会从 build context 中查找 Dockerfile 文件，我们也可以通过 -f 参数指定 Dockerfile 的位置。
5. 从这步开始就是镜像真正的构建过程。首先 Docker 将 build context 中的所有文件发送给 Docker daemon。build context 为镜像构建提供所需要的文件或目录。Dockerfile 中的 ADD、COPY 等命令可以将 build context 中的文件添加到镜像。此例中，build context 为当前目录 /root，该目录下的所有文件和子目录都会被发送给 Docker daemon。所以，使用 build context 就得小心了，不要将多余文件放到 build context，特别不要把 /、/usr 作为 build context，否则构建过程会相当缓慢甚至失败。
6. Step 1：执行 FROM，将 ubuntu 作为 base 镜像。ubuntu 镜像 ID 为 f753707788c5。
7. Step 2：执行 RUN，安装 vim，具体步骤为 ⑦、⑧、⑨。
8. 启动 ID 为 9f4d4166f7e3 的临时容器，在容器中通过 apt-get 安装 vim。
9. 安装成功后，将容器保存为镜像，其 ID 为 35ca89798937。
10. 这一步底层使用的是类似 docker commit 的命令。
11. 删除临时容器 9f4d4166f7e3。
12. 镜像构建成功。
