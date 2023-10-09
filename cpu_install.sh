#!/bin/sh

sudo apt-get update
sudo DEBIAN_FRONTEND=noninteractive  apt-get -y install software-properties-common
sudo DEBIAN_FRONTEND=noninteractive  apt-get -y install git
sudo DEBIAN_FRONTEND=noninteractive  apt-get -y install python3-pip
sudo DEBIAN_FRONTEND=noninteractive  apt-get -y install python3-venv
mkdir $HOME/python
python3 -m venv $HOME/python
echo "PATH=$HOME/python/bin:\$PATH" >> .profile
$HOME/python/bin/pip install torch torchvision
mkdir transformers
cd transformers
git clone https://github.com/achmelev/pico-gpt.git
