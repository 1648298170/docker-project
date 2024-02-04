#!/bin/bash

# 到项目目录
cd /data/projects

# 运行 Java 服务端包
nohup java -jar /data/projects/my_project_java_1/xxx.jar &

# 持久保持容器运行
exec tail -f /dev/null
