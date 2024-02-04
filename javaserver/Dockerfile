#基于debian
FROM debian:11

RUN mkdir -p /data/projects

RUN apt-get update
RUN apt-get install -y sudo

# .sh 格式转换
RUN apt-get install -y dos2unix

#安装curl
RUN apt-get install curl -y

# 安装 jdk, jre 包
RUN sudo apt-get install -y default-jdk
RUN sudo apt-get install -y default-jre

RUN java --version

# 拷贝启动脚本
COPY ./start.sh  /data/start.sh
RUN chmod -R 777 /data/projects
RUN chmod +x /data/start.sh
RUN dos2unix /data/start.sh





