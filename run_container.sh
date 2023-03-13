#!/bin/bash
xhost +

export UID=$(id -u)
export GID=$(id -g)
docker run -it --privileged \
    --user $UID:$GID \
    -v ${PWD}/PX4-Autopilot:/PX4-Autopilot:rw \
    -v ${PWD}/px4_tutorial_pkg:/px4_ws/src/px4_tutorial_pkg:rw \
    -v /tmp/.X11-unix:/tmp/.X11-unix:ro \
    --workdir="/quad_manip_ws" \
    --env="DISPLAY=$DISPLAY" \
    --env="QT_X11_NO_MITSHM=1" \
    -p 14556:14556/udp \
    --gpus all \
    --workdir=/PX4-Autopilot \
    --name=px4-noetic-container px4-noetic bash

xhost -