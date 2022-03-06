#!/bin/bash

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

pip3 --version
curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py
apt install python3-distutils
python3 get-pip.py
pip3 install --upgrade pip
pip config set global.index-url https://pypi.tuna.tsinghua.edu.cn/simple
cd ~/.pip
touch pip.conf
sudo chmod 777 ~/*
echo -e "[global] index-url = https://pypi.tuna.tsinghua.edu.cn/simple ">pip.conf
sudo apt-get update -y
sudo apt-get upgrade -y


sudo apt install sudo -y
sudo apt install vim -y
sudo apt install tmux -y
sudo apt install git -y
sudo apt install curl -y
sudo apt install tree -y
sudo apt install openssh-server -y
sudo apt install openssh-client -y
ssh-keygen
adduser poker
