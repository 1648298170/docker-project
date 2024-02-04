#基于debian
FROM debian:11

#维护者信息
MAINTAINER zhiruijie 1648298170@qq.com

#切换apt镜像源
# 设置为中国国内源
RUN sed -i 's/deb.debian.org/mirrors.ustc.edu.cn/g' /etc/apt/sources.list
RUN sed -i 's/security.debian.org/mirrors.ustc.edu.cn/g' /etc/apt/sources.list

WORKDIR /data/nodeServer

RUN apt-get update
RUN apt-get install -y sudo
# 安装 node-canvas 依赖环境
# RUN sudo apt-get -y install gcc-c++ cairo-devel libjpeg-turbo-devel pango-devel giflib-devel


# 安装 pupputeteer 可能所需依赖环境
RUN sudo apt-get install -y --no-upgrade ca-certificates fonts-liberation libasound2 libatk-bridge2.0-0 libatk1.0-0 libc6 libcairo2 libcups2 libdbus-1-3 libexpat1 libfontconfig1 libgbm1 libgcc1 libglib2.0-0 libgtk-3-0 libnspr4 libnss3 libpango-1.0-0 libpangocairo-1.0-0 libstdc++6 libx11-6 libx11-xcb1 libxcb1 libxcomposite1 libxcursor1 libxdamage1 libxext6 libxfixes3 libxi6 libxrandr2 libxrender1 libxss1 libxtst6 lsb-release wget xdg-utils

# 设置为国内时间
RUN ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime

#安装curl
RUN apt-get install curl -y

# 使用阿里云镜像地址安装Nodejs
RUN curl -O https://mirrors.aliyun.com/nodejs-release/v18.17.0/node-v18.17.0-linux-x64.tar.gz

# 解压
RUN tar -xvf ./node-v18.17.0-linux-x64.tar.gz

# 删除下载包
RUN rm -rf ./node-v18.17.0-linux-x64.tar.gz

# 移动并添加软链接
RUN mv ./node-v18.17.0-linux-x64 /usr/local/node-v18.17.0-linux-x64
RUN ln -s /usr/local/node-v18.17.0-linux-x64/bin/node /usr/local/bin/node
RUN ln -s /usr/local/node-v18.17.0-linux-x64/bin/npm /usr/local/bin/npm
RUN ln -s /usr/local/node-v18.17.0-linux-x64/bin/npx /usr/local/bin/npx

# 检验安装是否成功
RUN node -v
RUN npm -v

# 安装cnpm源
RUN sudo npm install -g cnpm@9.2.0 --registry=https://registry.npmmirror.com

# 设置cnpm 软链接
RUN ln -s /usr/local/node-v18.17.0-linux-x64/bin/cnpm /usr/local/bin/cnpm

# 安装typescript
RUN cnpm install -g typescript
RUN cnpm install -g @types/node

# typescript 软链接
RUN ln -s /usr/local/node-v18.17.0-linux-x64/bin/tsc /usr/local/bin/tsc


# 安装pm2
RUN npm install -g pm2

# 配置pm2全局变量
RUN ln -s /usr/local/node-v18.17.0-linux-x64/bin/pm2 /usr/local/bin/pm2

# 安装中文字体需要包
RUN apt-get install -y fontconfig
RUN apt-get install -y xfonts-utils


# 安装dos2unix工具
#`dos2unix`命令是一种用于将Windows系统下的文本文件转换为Unix或Linux系统下的文本文件格式的工具
RUN apt-get -y install dos2unix

WORKDIR /data

RUN mkdir /data/projects
#给与权限
RUN chmod -R 777 /data/projects




# COPY start.sh /data/start.sh

# 赋予权限
# RUN chmod +x /data/start.sh

# 转为 linux 格式脚本
# RUN sed -i 's/\r$//' /data/start.sh


#开放端口22
EXPOSE 22


# ENTRYPOINT ["/data/start.sh"]



COPY ./ecosystem.config.js /data/ecosystem.config.js


# CMD [ "pm2-runtime", "ecosystem.config.js"]








