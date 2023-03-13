#! /bin/bash
echo "*******"
echo "Preparing specific variables for the PX4-ROS stack"
echo "*******"

export ROS_TEST_RESULTS_DIR="$(pwd)/test_results"
export ROS_LOG_DIR="$(pwd)/ros_logs"
# PX4 stuff
HOME_DIR=$(pwd)
SRC_DIR=/PX4-Autopilot
BUILD_DIR=$SRC_DIR/build/px4_sitl_default

# setup Gazebo env and update package path
export GAZEBO_PLUGIN_PATH=$GAZEBO_PLUGIN_PATH:${HOME_DIR}/devel/lib:${BUILD_DIR}/build_gazebo-classic
export GAZEBO_MODEL_PATH=$GAZEBO_MODEL_PATH:${SRC_DIR}/Tools/simulation/gazebo-classic/sitl_gazebo-classic/models
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:${BUILD_DIR}:${BUILD_DIR}/build_gazebo-classic/devel/lib
export ROS_PACKAGE_PATH=$ROS_PACKAGE_PATH:$SRC_DIR:$SRC_DIR/Tools/simulation/gazebo-classic/sitl_gazebo-classic
