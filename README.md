## PX4 Docker Tutorial

This tutorial aspires to provide an isolated workspace for PX4 application development. (It also provides the ability for isolated PX4 backend dev, but it is a secondary benefit.) Step-by-step walkthrough of PX4 Docker setup is as follows:
### Repository and Docker Initialization
* Clone the repository from Github with `git clone -b noetic-devel https://github.com/tahsinkose/px4-docker-tutorial`.
* Move into `px4-docker-tutorial` folder.
* Do `git submodule update --init --recursive` to retrieve all submodules.
* Run `./build_image.sh`. The name of the generated docker image is `px4-noetic`.
* Run `./create_container.sh` script to create the container. This should be done once. For more terminals, you can use `./enter_container.sh`
* With either of those commands, you should have entered the container and the working directory should be `/px4-docker-tutorial/PX4-Autopilot`.

### PX4 Source Build
* After confirming above, run `make px4_sitl` command.
* Go into `/px4-docker-tutorial/PX4-Autopilot/Tools/simulation/gazebo-classic/sitl_gazebo-classic`.
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
catkin config --extend /opt/ros/noetic
catkin build -j4
source devel/setup.bash # This needs to be done in each new terminal.
```


### Running Simulation
`roslaunch px4_tutorial_pkg sim_single_uav.launch`

### Note

Note that this repository bumps a particular commit of `PX4-Autopilot` as its submodule. In order to track particular branches/tags/releases the corresponding options should be specified in `.gitmodules`.