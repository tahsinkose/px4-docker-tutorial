#! /bin/bash
echo "*******"
echo "Preparing specific variables for the PX4-ROS stack"
echo "*******"

export ROS_TEST_RESULTS_DIR="$(pwd)/test_results"
export ROS_LOG_DIR="$(pwd)/ros_logs"
# PX4 stuff
HOME_DIR=$(pwd)
SRC_DIR=/px4_docker_tutorial/PX4-Autopilot
PX4_GAZEBO_BUILD_DIR=$SRC_DIR/Tools/simulation/gazebo-classic/sitl_gazebo-classic/build

# setup Gazebo env and update package path
export GAZEBO_PLUGIN_PATH=$GAZEBO_PLUGIN_PATH:${HOME_DIR}/devel/lib:${PX4_GAZEBO_BUILD_DIR}
export GAZEBO_MODEL_PATH=$GAZEBO_MODEL_PATH:${SRC_DIR}/Tools/simulation/gazebo-classic/sitl_gazebo-classic/models
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:${BUILD_DIR}:${PX4_GAZEBO_BUILD_DIR}
export ROS_PACKAGE_PATH=$ROS_PACKAGE_PATH:$SRC_DIR:$SRC_DIR/Tools/simulation/gazebo-classic/sitl_gazebo-classic
