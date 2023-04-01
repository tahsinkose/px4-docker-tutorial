#!/bin/bash

xhost +

docker exec -it --privileged \
    --user ${USER} \
    --env="DISPLAY=$DISPLAY" \
    --env="QT_X11_NO_MITSHM=1" \
    px4-noetic-container bash

xhost -