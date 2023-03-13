FROM nvidia/cudagl:11.4.2-devel-ubuntu20.04
FROM px4io/px4-dev-ros-noetic:latest

# nvidia-docker hooks
ENV NVIDIA_VISIBLE_DEVICES \
    ${NVIDIA_VISIBLE_DEVICES:-all}
ENV NVIDIA_DRIVER_CAPABILITIES \
    ${NVIDIA_DRIVER_CAPABILITIES:+$NVIDIA_DRIVER_CAPABILITIES,}graphics

RUN apt-get update && apt-get install -y mesa-utils
# Install ros-dependencies
RUN apt-get install ros-noetic-message-to-tf python3-catkin-pkg -y

ENV TERM xterm-256color
ARG USER=docker
ARG UID=1000
ARG GID=1000
# default password for user
ARG PW=docker

RUN useradd -m ${USER} --uid=${UID} && echo "${USER}:${PW}" | \
      chpasswd && adduser ${USER} sudo
RUN mkdir -p /px4_ws/src
RUN chown ${UID} /px4_ws
USER ${UID}:${GID}
