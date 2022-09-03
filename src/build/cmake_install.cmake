# Install script for directory: /home/lsl/clBLAS-2.12/src

# Set the install prefix
if(NOT DEFINED CMAKE_INSTALL_PREFIX)
  set(CMAKE_INSTALL_PREFIX "/usr/local")
endif()
string(REGEX REPLACE "/$" "" CMAKE_INSTALL_PREFIX "${CMAKE_INSTALL_PREFIX}")

# Set the install configuration name.
if(NOT DEFINED CMAKE_INSTALL_CONFIG_NAME)
  if(BUILD_TYPE)
    string(REGEX REPLACE "^[^A-Za-z0-9_]+" ""
           CMAKE_INSTALL_CONFIG_NAME "${BUILD_TYPE}")
  else()
    set(CMAKE_INSTALL_CONFIG_NAME "Debug")
  endif()
  message(STATUS "Install configuration: \"${CMAKE_INSTALL_CONFIG_NAME}\"")
endif()

# Set the component getting installed.
if(NOT CMAKE_INSTALL_COMPONENT)
  if(COMPONENT)
    message(STATUS "Install component: \"${COMPONENT}\"")
    set(CMAKE_INSTALL_COMPONENT "${COMPONENT}")
  else()
    set(CMAKE_INSTALL_COMPONENT)
  endif()
endif()

# Install shared libraries without execute permission?
if(NOT DEFINED CMAKE_INSTALL_SO_NO_EXE)
  set(CMAKE_INSTALL_SO_NO_EXE "1")
endif()

# Is this installation the result of a crosscompile?
if(NOT DEFINED CMAKE_CROSSCOMPILING)
  set(CMAKE_CROSSCOMPILING "FALSE")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/./include" TYPE FILE FILES
    "/home/lsl/clBLAS-2.12/src/clBLAS.h"
    "/home/lsl/clBLAS-2.12/src/clAmdBlas.h"
    "/home/lsl/clBLAS-2.12/src/clAmdBlas.version.h"
    "/home/lsl/clBLAS-2.12/src/clBLAS-complex.h"
    "/home/lsl/clBLAS-2.12/src/build/include/clBLAS.version.h"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib64/cmake/clBLAS/clBLASTargets.cmake")
    file(DIFFERENT EXPORT_FILE_CHANGED FILES
         "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib64/cmake/clBLAS/clBLASTargets.cmake"
         "/home/lsl/clBLAS-2.12/src/build/CMakeFiles/Export/lib64/cmake/clBLAS/clBLASTargets.cmake")
    if(EXPORT_FILE_CHANGED)
      file(GLOB OLD_CONFIG_FILES "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib64/cmake/clBLAS/clBLASTargets-*.cmake")
      if(OLD_CONFIG_FILES)
        message(STATUS "Old export file \"$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib64/cmake/clBLAS/clBLASTargets.cmake\" will be replaced.  Removing files [${OLD_CONFIG_FILES}].")
        file(REMOVE ${OLD_CONFIG_FILES})
      endif()
    endif()
  endif()
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib64/cmake/clBLAS" TYPE FILE FILES "/home/lsl/clBLAS-2.12/src/build/CMakeFiles/Export/lib64/cmake/clBLAS/clBLASTargets.cmake")
  if("${CMAKE_INSTALL_CONFIG_NAME}" MATCHES "^([Dd][Ee][Bb][Uu][Gg])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib64/cmake/clBLAS" TYPE FILE FILES "/home/lsl/clBLAS-2.12/src/build/CMakeFiles/Export/lib64/cmake/clBLAS/clBLASTargets-debug.cmake")
  endif()
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib64/cmake/clBLAS" TYPE FILE FILES
    "/home/lsl/clBLAS-2.12/src/build/clBLASConfigVersion.cmake"
    "/home/lsl/clBLAS-2.12/src/build/clBLASConfig.cmake"
    )
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for each subdirectory.
  include("/home/lsl/clBLAS-2.12/src/build/library/cmake_install.cmake")
  include("/home/lsl/clBLAS-2.12/src/build/library/tools/tune/cmake_install.cmake")
  include("/home/lsl/clBLAS-2.12/src/build/library/tools/ktest/cmake_install.cmake")
  include("/home/lsl/clBLAS-2.12/src/build/samples/cmake_install.cmake")
  include("/home/lsl/clBLAS-2.12/src/build/tests/cmake_install.cmake")
  include("/home/lsl/clBLAS-2.12/src/build/library/blas/gens/tests/cmake_install.cmake")
  include("/home/lsl/clBLAS-2.12/src/build/library/blas/gens/legacy/tests/cmake_install.cmake")
  include("/home/lsl/clBLAS-2.12/src/build/library/common/tests/cmake_install.cmake")

endif()

if(CMAKE_INSTALL_COMPONENT)
  set(CMAKE_INSTALL_MANIFEST "install_manifest_${CMAKE_INSTALL_COMPONENT}.txt")
else()
  set(CMAKE_INSTALL_MANIFEST "install_manifest.txt")
endif()

string(REPLACE ";" "\n" CMAKE_INSTALL_MANIFEST_CONTENT
       "${CMAKE_INSTALL_MANIFEST_FILES}")
file(WRITE "/home/lsl/clBLAS-2.12/src/build/${CMAKE_INSTALL_MANIFEST}"
     "${CMAKE_INSTALL_MANIFEST_CONTENT}")
