# 移除旧版本(如果存在)
sudo apt-get remove docker docker-engine docker.io containerd runc
# Update the apt package index and install packages to allow apt to use a repository over HTTPS:
#更新apt包索引并安装包，以允许apt通过HTTPS使用存储库:
sudo apt-get update
sudo apt-get install \
    ca-certificates \
    curl \
    gnupg

#Add Docker’s official GPG key:
#添加Docker的官方GPG密钥:
sudo mkdir -m 0755 -p /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/debian/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg

#Use the following command to set up the repository:
#使用以下命令设置存储库:
echo \
    "deb [arch="$(dpkg --print-architecture)" signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/debian \
  "$(. /etc/os-release && echo "$VERSION_CODENAME")" stable" |
    sudo tee /etc/apt/sources.list.d/docker.list >/dev/null

#Install Docker Engine
#安装Docker引擎:
sudo chmod a+r /etc/apt/keyrings/docker.gpg
sudo apt-get update

#Install Docker Engine, containerd, and Docker Compose.
#安装Docker Engine、containerd和Docker Compose
sudo apt-get -y install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

#设置GITLAB_HOME
export GITLAB_HOME=/srv/gitlab

mv -i ./daemon.json /etc/docker/daemon.json

sudo systemctl daemon-reload
sudo systemctl restart docker

# docker version info
docker --version
docker compose version
