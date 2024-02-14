#!/bin/bash

# Update packages and Upgrade system
echo "Updating System.."
sudo apt-get update -y && sudo apt-get upgrade -y

# Install cmake, git, libboost and libpcap
echo "Installing cmake, git, libboost-dev, libpcap-dev, libboost-thread-dev, and libboost-system-dev..."
sudo apt install -y cmake git libboost-dev libpcap-dev libboost-thread-dev libboost-system-dev

# Install GStreamer and dependencies
echo "Installing GStreamer and dependencies..."
sudo apt-get install -y libglib2.0-dev libgstreamer1.0-dev libgstreamer-plugins-base1.0-dev gstreamer1.0-tools gstreamer1.0-x gstreamer1.0-plugins-base gstreamer1.0-plugins-good gstreamer1.0-plugins-bad gstreamer1.0-libav

# Install v4l-utils
echo "Installing v4l-utils..."
sudo apt-get install -y v4l-utils

echo "Installation complete."
