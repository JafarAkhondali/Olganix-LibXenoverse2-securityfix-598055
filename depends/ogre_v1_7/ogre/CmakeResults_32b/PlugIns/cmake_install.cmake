# Install script for directory: C:/Developpement/Dev/Ogre/GTS_v2_0_vs2008/ogre/PlugIns

# Set the install prefix
IF(NOT DEFINED CMAKE_INSTALL_PREFIX)
  SET(CMAKE_INSTALL_PREFIX "C:/Developpement/Dev/Ogre/GTS_v2_0_vs2008/ogre/CmakeResults_32b/")
ENDIF(NOT DEFINED CMAKE_INSTALL_PREFIX)
STRING(REGEX REPLACE "/$" "" CMAKE_INSTALL_PREFIX "${CMAKE_INSTALL_PREFIX}")

# Set the install configuration name.
IF(NOT DEFINED CMAKE_INSTALL_CONFIG_NAME)
  IF(BUILD_TYPE)
    STRING(REGEX REPLACE "^[^A-Za-z0-9_]+" ""
           CMAKE_INSTALL_CONFIG_NAME "${BUILD_TYPE}")
  ELSE(BUILD_TYPE)
    SET(CMAKE_INSTALL_CONFIG_NAME "Release")
  ENDIF(BUILD_TYPE)
  MESSAGE(STATUS "Install configuration: \"${CMAKE_INSTALL_CONFIG_NAME}\"")
ENDIF(NOT DEFINED CMAKE_INSTALL_CONFIG_NAME)

# Set the component getting installed.
IF(NOT CMAKE_INSTALL_COMPONENT)
  IF(COMPONENT)
    MESSAGE(STATUS "Install component: \"${COMPONENT}\"")
    SET(CMAKE_INSTALL_COMPONENT "${COMPONENT}")
  ELSE(COMPONENT)
    SET(CMAKE_INSTALL_COMPONENT)
  ENDIF(COMPONENT)
ENDIF(NOT CMAKE_INSTALL_COMPONENT)

IF(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for each subdirectory.
  INCLUDE("C:/Developpement/Dev/Ogre/GTS_v2_0_vs2008/ogre/CmakeResults_32b/PlugIns/OctreeSceneManager/cmake_install.cmake")
  INCLUDE("C:/Developpement/Dev/Ogre/GTS_v2_0_vs2008/ogre/CmakeResults_32b/PlugIns/BSPSceneManager/cmake_install.cmake")
  INCLUDE("C:/Developpement/Dev/Ogre/GTS_v2_0_vs2008/ogre/CmakeResults_32b/PlugIns/CgProgramManager/cmake_install.cmake")
  INCLUDE("C:/Developpement/Dev/Ogre/GTS_v2_0_vs2008/ogre/CmakeResults_32b/PlugIns/ParticleFX/cmake_install.cmake")
  INCLUDE("C:/Developpement/Dev/Ogre/GTS_v2_0_vs2008/ogre/CmakeResults_32b/PlugIns/PCZSceneManager/cmake_install.cmake")
  INCLUDE("C:/Developpement/Dev/Ogre/GTS_v2_0_vs2008/ogre/CmakeResults_32b/PlugIns/OctreeZone/cmake_install.cmake")

ENDIF(NOT CMAKE_INSTALL_LOCAL_ONLY)

