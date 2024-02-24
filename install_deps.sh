#!/bin/bash

# https://www.flir.com/support-center/iis/machine-vision/application-note/understanding-usbfs-on-linux/
echo "Updating USBFS_MEMORY_FS Parameter.."
sudo sh -c 'echo 1000 > /sys/module/usbcore/parameters/usbfs_memory_mb'
sudo cat /sys/module/usbcore/parameters/usbfs_memory_mb

# Update packages and Upgrade system
echo "Updating System..."
sudo apt update -y && sudo apt upgrade -y && sudo apt full-upgrade

# Install cmake, git, libboost and libpcap
echo "Installing cmake, git, libboost-dev, libpcap-dev, libboost-thread-dev, and libboost-system-dev..."
sudo apt install -y cmake git libboost-dev libpcap-dev libboost-thread-dev libboost-system-dev

# Install GStreamer and dependencies
echo "Installing GStreamer and dependencies..."
sudo apt install libx264-dev libjpeg-dev
sudo apt install -y libglib2.0-dev libgstreamer1.0-dev libgstreamer-plugins-base1.0-dev gstreamer1.0-tools gstreamer1.0-x gstreamer1.0-plugins-base gstreamer1.0-plugins-good gstreamer1.0-plugins-bad gstreamer1.0-libav libgstreamer-plugins-bad1.0-dev gstreamer1.0-plugins-ugly gstreamer1.0-gl

# Install v4l-utils
echo "Installing v4l-utils..."
sudo apt install -y v4l-utils

# Install usbtop
echo "Installing usbtop..."
git clone https://github.com/aguinet/usbtop.git
cd usbtop
mkdir _build && cd _build 
cmake -DCMAKE_BUILD_TYPE=Release ..
make
sudo make install


echo "Installation complete!"
