#!/bin/bash

function apt_source_change()
{
mv /etc/apt/sources.list /etc/apt/sources.list.back
touch /etc/apt/sources.list
chmod 777 /etc/apt/*
cat>>/etc/apt/sources.list<<EOF    #多行输入
# 默认注释了源码镜像以提高 apt update 速度，如有需要可自行取消注释
deb https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ focal main restricted universe multiverse
# deb-src https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ focal main restricted universe multiverse
deb https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ focal-updates main restricted universe multiverse
# deb-src https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ focal-updates main restricted universe multiverse
deb https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ focal-backports main restricted universe multiverse
# deb-src https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ focal-backports main restricted universe multiverse
deb https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ focal-security main restricted universe multiverse
# deb-src https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ focal-security main restricted universe multiverse

# 预发布软件源，不建议启用
# deb https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ focal-proposed main restricted universe multiverse
# deb-src https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ focal-proposed main restricted universe multiverse
EOF
apt update
}

function pip_install()
{
pip3 --version
curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py
apt install python3-distutils
python3 get-pip.py
pip3 install --upgrade pip
pip config set global.index-url https://pypi.tuna.tsinghua.edu.cn/simple
}

function ubuntu_init()
{
apt install sudo -y
apt install vim -y
apt install tmux -y
apt install git -y
apt install curl -y
apt install tree -y
useradd poker -p poker -m -d /home/poker/
}

function ssh_install()
{
apt install openssh-server -y
apt install openssh-client -y
ssh-keygen
}

function docker_install()
{
apt install curl -y
curl -fsSL https://get.docker.com -o get-docker.sh
sudo sh get-docker.sh
sudo usermod -aG docker $USER
}

function menu()
{
echo "###########################################################"
echo "#              Please enter your choise:                  #"
echo "#              (0) 执行全部                               #"
echo "#              (1) pip安装与换源                          #"
echo "#              (2) 安装常用软件并创建用户poker            #"
echo "#              (3) 安装ssh-server和ssh-client             #"
echo "#              (4) apt换源		                #"
echo "#              (5) docker安装                             #"
echo "#              (q) 退出			                #"
echo "###########################################################"

read cho

apt update

case $cho in
	0)
	apt_source_change
	pip_install
	ubuntu_init
	docker_install
	ssh_install
	;;
	1)
	pip_install
	;;
	2)
	ubuntu_init
	;;
	3)
	ssh-install
	;;
	4)
	apt_source_change
	;;
	5)
	docker_install
	;;
	q)
	exit;;
esac
}

menu
