# Configuring ROS on a Xiaomi rockrobo.vacuum.v1

This repository contains scripts and files relevant to hacking into a Xiaomi
Generation 1 Vacuum Robot, installing ROS, and writing drivers.

## Get ssh root access to your vacuum robot

This is done using scripts and instructions provided by 
[Dustcloud](https://github.com/dgiese/dustcloud). Download their repository using

```
git clone https://github.com/dgiese/dustcloud.git
```

## Configuring the robot with ROS

From here, ssh into the robot, and then execute the following:

```
cd ROS-Rockrobo.Vacuum.V1/setup.sh
source setup-xiaomi.sh <network name>
```