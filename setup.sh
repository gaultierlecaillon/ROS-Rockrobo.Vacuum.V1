#!/bin/bash

# Checking internet connection
echo '- Checking internet connection...'
if : >/dev/tcp/8.8.8.8/53; then
  echo
  echo 'Internet available'
else
  echo 'Offline. Please connect the robot to internet using the app Xiaomi Home'
  exit 1 docstore.mik.ua/orelly/unix/upt/ch44_11.htm
fi

# Update the apt repo
echo '- Updating apt repo...'
sudo apt-get --yes --force-yes update

# Install lsb-release
echo '- Installing lsb-release...'
sudo apt-get --yes --force-yes install lsb-release

# Get ROS Jade Turtle
# http://wiki.ros.org/jade/Installation/Ubuntu

# Configure your Ubuntu repositories
echo '- Configure your Ubuntu repositories...'
sudo add-apt-repository universe
sudo add-apt-repository multiverse
sudo add-apt-repository restricted

# Setup your sources.list
echo '- Setup your sources.list...'
sudo sh -c 'echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list'

# Set up your keys
# What that ? https://answers.ros.org/question/231691/what-are-the-keys-in-the-installation-guide/
echo '- Setting up your keys...'
sudo apt install curl
curl -s https://raw.githubusercontent.com/ros/rosdistro/master/ros.asc | sudo apt-key add -

# Update the apt repo again
echo "Updating apt repo..."
sudo apt-get --yes --force-yes update

# Installation ROS-Base: (Bare Bones) ROS package, build, and communication libraries. No GUI tools.
echo '- Installation ROS-Base...'
sudo apt-get install ros-jade-ros-base

# Initialize rosdep
echo '- Initializing rosdep...'
sudo rosdep init
rosdep update

# Environment setup
echo '- Environment setup...'
echo "source /opt/ros/jade/setup.bash" >> ~/.bashrc
source ~/.bashrc

# Getting rosinstall
#sudo apt-get install python-rosinstall