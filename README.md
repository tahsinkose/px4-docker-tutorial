## PX4 Docker Tutorial

This tutorial aspires to provide an isolated workspace for PX4 application development. (It also provides the ability for isolated PX4 backend dev, but it is a secondary benefit.) Step-by-step walkthrough of PX4 Docker setup is as follows:
### Repository and Docker Initialization
* Clone the repository from Github with `git clone -b melodic-devel https://github.com/tahsinkose/px4-docker-tutorial`.
* Move into `px4-docker-tutorial` folder.
* Do `git submodule update --init --recursive` to retrieve all submodules.
* Run `./build_image.sh`. The name of the generated docker image is `px4-melodic`.
* Run `./create_container.sh` script to create the container. This should be done once. For more terminals, you can use `./enter_container.sh`
* With either of those commands, you should have entered the container and the working directory should be `/px4-docker-tutorial/PX4-Autopilot`.

### PX4 Source Build
* After confirming above, run `make px4_sitl` command.
* Go into `/px4-docker-tutorial/PX4-Autopilot/Tools/sitl_gazebo`.
* Do `git checkout bd941689b6e9d3e628a1e786d1d042d48005dc7b`. This is required as the current SITL-gazebo bump fails compilation.
* Do the following to compile PX4 Gazebo plugins:
```
mkdir build
cd build
cmake ..
make -j4
```

### ROS Workspace Build
```
cd /px4_ws
catkin config --extend /opt/ros/melodic
catkin build -j4
source devel/setup.bash # This needs to be done in each new terminal.
```


### Running Simulation
`roslaunch px4_tutorial_pkg sim_single_uav.launch`

### QGroundControl connection
This is unfortunately not straightforward at the moment and requires inspection of two parameters:
1. We need to figure out the UDP port of quadcopter. It can be found in `/px4-docker-tutorial/PX4-Autopilot/build/px4_sitl_default/etc/init.d-posix/px4-rc.mavlink` on the parameter `udp_gcs_port_local`.
2. The IP address of the container we just created -> `docker inspect -f '{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}'  px4-noetic-container`

### Note

Note that this repository bumps `PX4-Autopilot` to v1.13 release. In order to use a newer version of it, you need to checkout and bump accordingly.