curl -fsSL https://get.docker.com -o get-docker.sh # 使用官方脚本一键安装
sudo sh get-docker.sh
sudo usermod -aG docker $USER # 将当前用户假如docker用户组避免每次使用docker命令都要加上sudo权限
