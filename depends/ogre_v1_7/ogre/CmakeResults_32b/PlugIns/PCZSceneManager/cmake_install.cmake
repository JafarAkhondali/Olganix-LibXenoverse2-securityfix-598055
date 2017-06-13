# Install script for directory: C:/Developpement/Dev/Ogre/GTS_v2_0_vs2008/ogre/PlugIns/PCZSceneManager

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

IF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  IF("${CMAKE_INSTALL_CONFIG_NAME}" MATCHES "^([Rr][Ee][Ll][Ee][Aa][Ss][Ee])$")
    FILE(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/Release/opt" TYPE STATIC_LIBRARY OPTIONAL FILES "C:/Developpement/Dev/Ogre/GTS_v2_0_vs2008/ogre/CmakeResults_32b/lib/Release/Plugin_PCZSceneManager.lib")
  ENDIF("${CMAKE_INSTALL_CONFIG_NAME}" MATCHES "^([Rr][Ee][Ll][Ee][Aa][Ss][Ee])$")
ENDIF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")

IF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  IF("${CMAKE_INSTALL_CONFIG_NAME}" MATCHES "^([Rr][Ee][Ll][Ee][Aa][Ss][Ee])$")
    FILE(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/bin/Release" TYPE SHARED_LIBRARY FILES "C:/Developpement/Dev/Ogre/GTS_v2_0_vs2008/ogre/CmakeResults_32b/bin/Release/Plugin_PCZSceneManager.dll")
  ENDIF("${CMAKE_INSTALL_CONFIG_NAME}" MATCHES "^([Rr][Ee][Ll][Ee][Aa][Ss][Ee])$")
ENDIF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")

IF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  IF("${CMAKE_INSTALL_CONFIG_NAME}" MATCHES "^([Rr][Ee][Ll][Ww][Ii][Tt][Hh][Dd][Ee][Bb][Ii][Nn][Ff][Oo])$")
    FILE(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/RelWithDebInfo/opt" TYPE STATIC_LIBRARY OPTIONAL FILES "C:/Developpement/Dev/Ogre/GTS_v2_0_vs2008/ogre/CmakeResults_32b/lib/RelWithDebInfo/Plugin_PCZSceneManager.lib")
  ENDIF("${CMAKE_INSTALL_CONFIG_NAME}" MATCHES "^([Rr][Ee][Ll][Ww][Ii][Tt][Hh][Dd][Ee][Bb][Ii][Nn][Ff][Oo])$")
ENDIF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")

IF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  IF("${CMAKE_INSTALL_CONFIG_NAME}" MATCHES "^([Rr][Ee][Ll][Ww][Ii][Tt][Hh][Dd][Ee][Bb][Ii][Nn][Ff][Oo])$")
    FILE(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/bin/RelWithDebInfo" TYPE SHARED_LIBRARY FILES "C:/Developpement/Dev/Ogre/GTS_v2_0_vs2008/ogre/CmakeResults_32b/bin/RelWithDebInfo/Plugin_PCZSceneManager.dll")
  ENDIF("${CMAKE_INSTALL_CONFIG_NAME}" MATCHES "^([Rr][Ee][Ll][Ww][Ii][Tt][Hh][Dd][Ee][Bb][Ii][Nn][Ff][Oo])$")
ENDIF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")

IF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  IF("${CMAKE_INSTALL_CONFIG_NAME}" MATCHES "^([Mm][Ii][Nn][Ss][Ii][Zz][Ee][Rr][Ee][Ll])$")
    FILE(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/MinSizeRel/opt" TYPE STATIC_LIBRARY OPTIONAL FILES "C:/Developpement/Dev/Ogre/GTS_v2_0_vs2008/ogre/CmakeResults_32b/lib/MinSizeRel/Plugin_PCZSceneManager.lib")
  ENDIF("${CMAKE_INSTALL_CONFIG_NAME}" MATCHES "^([Mm][Ii][Nn][Ss][Ii][Zz][Ee][Rr][Ee][Ll])$")
ENDIF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")

IF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  IF("${CMAKE_INSTALL_CONFIG_NAME}" MATCHES "^([Mm][Ii][Nn][Ss][Ii][Zz][Ee][Rr][Ee][Ll])$")
    FILE(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/bin/MinSizeRel" TYPE SHARED_LIBRARY FILES "C:/Developpement/Dev/Ogre/GTS_v2_0_vs2008/ogre/CmakeResults_32b/bin/MinSizeRel/Plugin_PCZSceneManager.dll")
  ENDIF("${CMAKE_INSTALL_CONFIG_NAME}" MATCHES "^([Mm][Ii][Nn][Ss][Ii][Zz][Ee][Rr][Ee][Ll])$")
ENDIF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")

IF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  IF("${CMAKE_INSTALL_CONFIG_NAME}" MATCHES "^([Dd][Ee][Bb][Uu][Gg])$")
    FILE(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/Debug/opt" TYPE STATIC_LIBRARY OPTIONAL FILES "C:/Developpement/Dev/Ogre/GTS_v2_0_vs2008/ogre/CmakeResults_32b/lib/Debug/Plugin_PCZSceneManager_d.lib")
  ENDIF("${CMAKE_INSTALL_CONFIG_NAME}" MATCHES "^([Dd][Ee][Bb][Uu][Gg])$")
ENDIF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")

IF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  IF("${CMAKE_INSTALL_CONFIG_NAME}" MATCHES "^([Dd][Ee][Bb][Uu][Gg])$")
    FILE(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/bin/Debug" TYPE SHARED_LIBRARY FILES "C:/Developpement/Dev/Ogre/GTS_v2_0_vs2008/ogre/CmakeResults_32b/bin/Debug/Plugin_PCZSceneManager_d.dll")
  ENDIF("${CMAKE_INSTALL_CONFIG_NAME}" MATCHES "^([Dd][Ee][Bb][Uu][Gg])$")
ENDIF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")

IF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  FILE(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/OGRE/Plugins/PCZSceneManager" TYPE FILE FILES
    "C:/Developpement/Dev/Ogre/GTS_v2_0_vs2008/ogre/PlugIns/PCZSceneManager/include/OgreAntiPortal.h"
    "C:/Developpement/Dev/Ogre/GTS_v2_0_vs2008/ogre/PlugIns/PCZSceneManager/include/OgreCapsule.h"
    "C:/Developpement/Dev/Ogre/GTS_v2_0_vs2008/ogre/PlugIns/PCZSceneManager/include/OgreDefaultZone.h"
    "C:/Developpement/Dev/Ogre/GTS_v2_0_vs2008/ogre/PlugIns/PCZSceneManager/include/OgrePCPlane.h"
    "C:/Developpement/Dev/Ogre/GTS_v2_0_vs2008/ogre/PlugIns/PCZSceneManager/include/OgrePCZCamera.h"
    "C:/Developpement/Dev/Ogre/GTS_v2_0_vs2008/ogre/PlugIns/PCZSceneManager/include/OgrePCZFrustum.h"
    "C:/Developpement/Dev/Ogre/GTS_v2_0_vs2008/ogre/PlugIns/PCZSceneManager/include/OgrePCZLight.h"
    "C:/Developpement/Dev/Ogre/GTS_v2_0_vs2008/ogre/PlugIns/PCZSceneManager/include/OgrePCZoneFactory.h"
    "C:/Developpement/Dev/Ogre/GTS_v2_0_vs2008/ogre/PlugIns/PCZSceneManager/include/OgrePCZone.h"
    "C:/Developpement/Dev/Ogre/GTS_v2_0_vs2008/ogre/PlugIns/PCZSceneManager/include/OgrePCZPlugin.h"
    "C:/Developpement/Dev/Ogre/GTS_v2_0_vs2008/ogre/PlugIns/PCZSceneManager/include/OgrePCZPrerequisites.h"
    "C:/Developpement/Dev/Ogre/GTS_v2_0_vs2008/ogre/PlugIns/PCZSceneManager/include/OgrePCZSceneManager.h"
    "C:/Developpement/Dev/Ogre/GTS_v2_0_vs2008/ogre/PlugIns/PCZSceneManager/include/OgrePCZSceneNode.h"
    "C:/Developpement/Dev/Ogre/GTS_v2_0_vs2008/ogre/PlugIns/PCZSceneManager/include/OgrePCZSceneQuery.h"
    "C:/Developpement/Dev/Ogre/GTS_v2_0_vs2008/ogre/PlugIns/PCZSceneManager/include/OgrePortal.h"
    "C:/Developpement/Dev/Ogre/GTS_v2_0_vs2008/ogre/PlugIns/PCZSceneManager/include/OgrePortalBase.h"
    "C:/Developpement/Dev/Ogre/GTS_v2_0_vs2008/ogre/PlugIns/PCZSceneManager/include/OgreSegment.h"
    )
ENDIF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")

