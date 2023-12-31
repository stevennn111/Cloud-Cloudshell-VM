#!/bin/bash

# Update and upgrade system
sudo apt update
sudo apt upgrade -y
sudo apt install build-essential -y
sudo apt install linux-headers-$(uname -r) -y
sudo apt install software-properties-common -y

# Install CUDA
wget https://developer.download.nvidia.com/compute/cuda/12.2.0/local_installers/cuda-repo-debian11-12-2-local_12.2.0-535.54.03-1_amd64.deb
sudo dpkg -i cuda-repo-debian11-12-2-local_12.2.0-535.54.03-1_amd64.deb
sudo cp /var/cuda-repo-debian11-12-2-local/cuda-*-keyring.gpg /usr/share/keyrings/
sudo add-apt-repository contrib
sudo apt-get update
sudo apt-get -y install cuda

# Install Chrome Remote Desktop, Chrome Browser, and KDE Plasma GUI
sudo apt update
curl -L -o chrome-remote-desktop_current_amd64.deb \
    https://dl.google.com/linux/direct/chrome-remote-desktop_current_amd64.deb
sudo DEBIAN_FRONTEND=noninteractive \
    apt-get install --assume-yes ./chrome-remote-desktop_current_amd64.deb
    
sudo DEBIAN_FRONTEND=noninteractive \
    apt install --assume-yes  task-kde-desktop
sudo bash -c 'echo "exec /etc/X11/Xsession /usr/bin/startplasma-x11" > /etc/chrome-remote-desktop-session'
curl -L -o google-chrome-stable_current_amd64.deb \
https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo apt install --assume-yes ./google-chrome-stable_current_amd64.deb

# Install Miniconda
curl -sL "https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh" > "Miniconda3.sh"
bash Miniconda3.sh
source ~/.bashrc
