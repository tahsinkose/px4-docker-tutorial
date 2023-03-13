#!/bin/bash

xhost +

export UID=$(id -u)
export GID=$(id -g)

docker exec -it --privileged \
    --user $UID:$GID \
    --env="DISPLAY=$DISPLAY" \
    --env="QT_X11_NO_MITSHM=1" \
    px4-noetic-container bash

xhost -