#进入当前存放nodeserver文件夹
cd /data/docker-template-prod/nodeserver/project/nest_project
#删除原本的压缩文件
rm -rf nest_final.zip
#上传文件
rz -b
#解压文件
unzip -o ./nest_final.zip
#重启容器
docker restart nodeserver

