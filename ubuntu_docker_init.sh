#!/bin/bash

function apt_source_change()
{
sudo mv /etc/apt/sources.list /etc/apt/sources.list.back
sudo touch /etc/apt/sources.list
sudo chmod 777 /etc/apt/*
sudo cat>>/etc/apt/sources.list<<EOF    #多行输入
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
sudo apt update
}

function pip_install()
{
pip3 --version
curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py
sudo apt install python3-distutils
python3 get-pip.py
sudo pip3 install --upgrade pip
sudo pip config set global.index-url https://pypi.tuna.tsinghua.edu.cn/simple
}

function ubuntu_init()
{
sudo apt install sudo -y
sudo apt install vim -y
sudo apt install tmux -y
sudo apt install git -y
sudo apt install curl -y
sudo apt install tree -y
useradd poker -p poker -m -d /home/poker/
}

function ssh_install()
{
sudo apt install openssh-server -y
sudo apt install openssh-client -y
ssh-keygen
}

function docker_install()
{
sudo apt update
sudo apt install curl -y
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

case $cho in
	0)
	apt_source_change
	pip_install
	ubuntu_init
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
