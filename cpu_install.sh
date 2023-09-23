#!/bin/sh

sudo apt-get update
sudo DEBIAN_FRONTEND=noninteractive  apt-get -y install software-properties-common
sudo DEBIAN_FRONTEND=noninteractive  apt-get -y install git
sudo DEBIAN_FRONTEND=noninteractive  apt-get -y install python3-pip
sudo DEBIAN_FRONTEND=noninteractive apt-get -y install joe
sudo pip3 install torch torchvision
mkdir transformers
cd transformers
git clone https://github.com/achmelev/pico-gpt.git
