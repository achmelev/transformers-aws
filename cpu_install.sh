#!/bin/sh

sudo apt update
sudo apt -y install software-properties-common
sudo apt -y install git
sudo apt -y install joe
sudo apt -y install python3-pip
sudo pip3 install torch torchvision
mkdir transformers
cd transformers
git clone https://github.com/achmelev/codevalidation.git


