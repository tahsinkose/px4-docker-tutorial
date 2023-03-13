cmake_minimum_required(VERSION 2.8.3)
project(px4_tutorial_pkg)

set(PACKAGE_DEPENDENCIES
  gazebo_ros
)

find_package(catkin REQUIRED COMPONENTS
  ${PACKAGE_DEPENDENCIES}
)

find_package(GAZEBO REQUIRED)

catkin_package(
  CATKIN_DEPENDS ${PACKAGE_DEPENDENCIES}
)

set(CMAKE_CXX_STANDARD 14)

add_compile_options(
  -Wall
  -Werror
  -pedantic
)

catkin_add_env_hooks (custom_env SHELLS bash DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR}/env-hooks)

install(DIRECTORY launch
  DESTINATION ${CATKIN_PACKAGE_SHARE_DESTINATION})

install(DIRECTORY worlds
  DESTINATION ${CATKIN_PACKAGE_SHARE_DESTINATION})
