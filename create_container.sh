#!/bin/bash
xhost +

export UID=$(id -u)
export GID=$(id -g)
docker run -it --privileged \
    --user $UID:$GID \
    -v ${PWD}:/px4-docker-tutorial:rw \
    -v ${PWD}/px4_tutorial_pkg:/px4_ws/src/px4_tutorial_pkg:rw \
    -v /tmp/.X11-unix:/tmp/.X11-unix:ro \
    --env="DISPLAY=$DISPLAY" \
    --env="QT_X11_NO_MITSHM=1" \
    -p 14556:14556/udp \
    --gpus all \
    --workdir=/px4-docker-tutorial/PX4-Autopilot \
    --name=px4-noetic-container px4-noetic bash

xhost -