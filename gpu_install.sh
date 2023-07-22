#!/bin/sh

sudo apt update
sudo apt -y install software-properties-common

#CUDA
sudo apt -y install build-essential
sudo apt -y install linux-headers-$(uname -r)
mkdir cuda
cd cuda
wget https://developer.download.nvidia.com/compute/cuda/12.2.0/local_installers/cuda-repo-debian11-12-2-local_12.2.0-535.54.03-1_amd64.deb
sudo apt install ./cuda-repo-debian11-12-2-local_12.2.0-535.54.03-1_amd64.deb
sudo cp /var/cuda-repo-debian11-12-2-local/cuda-8970786D-keyring.gpg /usr/share/keyrings/
sudo add-apt-repository contrib
sudo apt-get update
sudo DEBIAN_FRONTEND=noninteractive apt -y install cuda
rm ./cuda-repo-debian11-12-2-local_12.2.0-535.54.03-1_amd64.deb
cd ..
#Rest
sudo apt -y install git
sudo apt -y install joe
sudo apt -y install python3-pip
sudo pip3 install torch torchvision
mkdir transformers
cd transformers
git clone https://github.com/achmelev/codevalidation.git

