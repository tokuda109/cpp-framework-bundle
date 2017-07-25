cmake_minimum_required(VERSION 3.8.2 FATAL_ERROR)

execute_process(
    COMMAND /usr/bin/xcode-select -print-path
    OUTPUT_VARIABLE XCODE_DEVELOPER_DIR
    OUTPUT_STRIP_TRAILING_WHITESPACE
)

execute_process(
    COMMAND /usr/bin/xcrun -sdk iphonesimulator -find gcc
    OUTPUT_VARIABLE CMAKE_C_COMPILER
    OUTPUT_STRIP_TRAILING_WHITESPACE
)

execute_process(
    COMMAND /usr/bin/xcrun -sdk iphonesimulator -find g++
    OUTPUT_VARIABLE CMAKE_CXX_COMPILER
    OUTPUT_STRIP_TRAILING_WHITESPACE
)

execute_process(
    COMMAND /usr/bin/xcrun -sdk iphonesimulator --show-sdk-path
    OUTPUT_VARIABLE CMAKE_OSX_SYSROOT
    OUTPUT_STRIP_TRAILING_WHITESPACE
)

set(CMAKE_SHARED_LINKER_FLAGS "-Wall")

set(CMAKE_SYSTEM_NAME Darwin)
set(CMAKE_SYSTEM_VERSION 1)
set(UNIX True)
set(APPLE True)
set(IOS True)

  set(CMAKE_OSX_DEPLOYMENT_TARGET "" CACHE STRING "Force unset of the deployment target for iOS" FORCE)

  find_program (CMAKE_UNAME uname /bin /usr/bin /usr/local/bin)
  if (CMAKE_UNAME)
      exec_program(uname ARGS -r OUTPUT_VARIABLE CMAKE_HOST_SYSTEM_VERSION)
      string (REGEX REPLACE "^([0-9]+)\\.([0-9]+).*$" "\\1" DARWIN_MAJOR_VERSION "${CMAKE_HOST_SYSTEM_VERSION}")
  endif (CMAKE_UNAME)

  set(CMAKE_CXX_COMPILER_WORKS TRUE)
  set(CMAKE_C_COMPILER_WORKS TRUE)

set(CMAKE_SHARED_LIBRARY_PREFIX "lib")
set(CMAKE_SHARED_LIBRARY_SUFFIX ".dylib")
set(CMAKE_SHARED_MODULE_PREFIX "lib")
set(CMAKE_SHARED_MODULE_SUFFIX ".so")
set(CMAKE_MODULE_EXISTS 1)
set(CMAKE_DL_LIBS "")

set(CMAKE_C_OSX_COMPATIBILITY_VERSION_FLAG "-compatibility_version ")
set(CMAKE_C_OSX_CURRENT_VERSION_FLAG "-current_version ")
set(CMAKE_CXX_OSX_COMPATIBILITY_VERSION_FLAG "${CMAKE_C_OSX_COMPATIBILITY_VERSION_FLAG}")
set(CMAKE_CXX_OSX_CURRENT_VERSION_FLAG "${CMAKE_C_OSX_CURRENT_VERSION_FLAG}")

set(CMAKE_C_FLAGS_INIT "")
set(CMAKE_CXX_FLAGS_INIT "-fvisibility=hidden -fvisibility-inlines-hidden")

set(CMAKE_C_LINK_FLAGS "-Wl,-search_paths_first ${CMAKE_C_LINK_FLAGS}")
set(CMAKE_CXX_LINK_FLAGS "-Wl,-search_paths_first ${CMAKE_CXX_LINK_FLAGS}")

set(CMAKE_MACOSX_BUNDLE True)
set(CMAKE_PLATFORM_HAS_INSTALLNAME 1)
set(CMAKE_SHARED_LIBRARY_CREATE_C_FLAGS "-dynamiclib -headerpad_max_install_names")
set(CMAKE_SHARED_MODULE_CREATE_C_FLAGS "-bundle -headerpad_max_install_names")
set(CMAKE_SHARED_MODULE_LOADER_C_FLAG "-Wl,-bundle_loader,")
set(CMAKE_SHARED_MODULE_LOADER_CXX_FLAG "-Wl,-bundle_loader,")
set(CMAKE_FIND_LIBRARY_SUFFIXES ".dylib" ".so" ".a")

set(CMAKE_FIND_ROOT_PATH ${CMAKE_OSX_SYSROOT})
set(CMAKE_FIND_ROOT_PATH_MODE_PROGRAM NEVER)
set(CMAKE_FIND_ROOT_PATH_MODE_LIBRARY ONLY)
set(CMAKE_FIND_ROOT_PATH_MODE_INCLUDE ONLY)

set(CMAKE_OSX_ARCHITECTURES "i386;x86_64")

if (NOT DEFINED CMAKE_INSTALL_NAME_TOOL)
    find_program(CMAKE_INSTALL_NAME_TOOL install_name_tool)
endif (NOT DEFINED CMAKE_INSTALL_NAME_TOOL)

if (NOT DEFINED IOS_PLATFORM)
    set (IOS_PLATFORM "OS")
endif (NOT DEFINED IOS_PLATFORM)
set(IOS_PLATFORM ${IOS_PLATFORM} CACHE STRING "Type of iOS Platform")

if (NOT DEFINED BUILD_ARM64)
    set(BUILD_ARM64 true)
endif (NOT DEFINED BUILD_ARM64)
set (BUILD_ARM64 ${BUILD_ARM64} CACHE STRING "Build arm64 arch or not")

if (${IOS_PLATFORM} STREQUAL "OS")
    set(IOS_PLATFORM_LOCATION "iPhoneOS.platform")

    set(CMAKE_XCODE_EFFECTIVE_PLATFORMS "-iphoneos")
elseif (${IOS_PLATFORM} STREQUAL "SIMULATOR")
    set(SIMULATOR true)
    set(IOS_PLATFORM_LOCATION "iPhoneSimulator.platform")

    set(CMAKE_XCODE_EFFECTIVE_PLATFORMS "-iphonesimulator")
elseif (${IOS_PLATFORM} STREQUAL "SIMULATOR64")
    set(SIMULATOR true)
	  set(IOS_PLATFORM_LOCATION "iPhoneSimulator.platform")

    set(CMAKE_XCODE_EFFECTIVE_PLATFORMS "-iphonesimulator")
else (${IOS_PLATFORM} STREQUAL "OS")
    message(FATAL_ERROR "Unsupported IOS_PLATFORM value selected. Please choose OS or SIMULATOR")
endif (${IOS_PLATFORM} STREQUAL "OS")

exec_program(/usr/bin/xcode-select ARGS -print-path OUTPUT_VARIABLE CMAKE_XCODE_DEVELOPER_DIR)
set(XCODE_POST_43_ROOT "${CMAKE_XCODE_DEVELOPER_DIR}/Platforms/${IOS_PLATFORM_LOCATION}/Developer")
set(XCODE_PRE_43_ROOT "/Developer/Platforms/${IOS_PLATFORM_LOCATION}/Developer")
if (NOT DEFINED CMAKE_IOS_DEVELOPER_ROOT)
    if (EXISTS ${XCODE_POST_43_ROOT})
        set(CMAKE_IOS_DEVELOPER_ROOT ${XCODE_POST_43_ROOT})
    elseif(EXISTS ${XCODE_PRE_43_ROOT})
        set(CMAKE_IOS_DEVELOPER_ROOT ${XCODE_PRE_43_ROOT})
    endif (EXISTS ${XCODE_POST_43_ROOT})
endif (NOT DEFINED CMAKE_IOS_DEVELOPER_ROOT)
set(CMAKE_IOS_DEVELOPER_ROOT ${CMAKE_IOS_DEVELOPER_ROOT} CACHE PATH "Location of iOS Platform")

if (NOT DEFINED CMAKE_IOS_SDK_ROOT)
    file (GLOB _CMAKE_IOS_SDKS "${CMAKE_IOS_DEVELOPER_ROOT}/SDKs/*")
    if (_CMAKE_IOS_SDKS) 
        list (SORT _CMAKE_IOS_SDKS)
        list (REVERSE _CMAKE_IOS_SDKS)
        list (GET _CMAKE_IOS_SDKS 0 CMAKE_IOS_SDK_ROOT)
    else (_CMAKE_IOS_SDKS)
        message (FATAL_ERROR "No iOS SDK's found in default search path ${CMAKE_IOS_DEVELOPER_ROOT}. Manually set CMAKE_IOS_SDK_ROOT or install the iOS SDK.")
    endif (_CMAKE_IOS_SDKS)
    message (STATUS "Toolchain using default iOS SDK: ${CMAKE_IOS_SDK_ROOT}")
endif (NOT DEFINED CMAKE_IOS_SDK_ROOT)
set(CMAKE_IOS_SDK_ROOT ${CMAKE_IOS_SDK_ROOT} CACHE PATH "Location of the selected iOS SDK")

if (${IOS_PLATFORM} STREQUAL "OS")
    set(IOS_ARCH armv7 armv7s arm64)
elseif (${IOS_PLATFORM} STREQUAL "SIMULATOR")
    set(IOS_ARCH i386)
elseif (${IOS_PLATFORM} STREQUAL "SIMULATOR64")
    set(IOS_ARCH x86_64)
endif (${IOS_PLATFORM} STREQUAL "OS")

set(CMAKE_OSX_ARCHITECTURES ${IOS_ARCH} CACHE string  "Build architecture for iOS")

set(CMAKE_FIND_ROOT_PATH ${CMAKE_IOS_DEVELOPER_ROOT} ${CMAKE_IOS_SDK_ROOT} ${CMAKE_PREFIX_PATH} CACHE string  "iOS find search path root")

set(CMAKE_FIND_FRAMEWORK FIRST)

set(APPLE_IOS ON)
set(TARGET_IPHONE_SIMULATOR ON)

add_library(
    ${FRAMEWORK_NAME} SHARED
    SampleLib.h
    SampleLib.mm
    sample.h
    sample.cpp
)

set_target_properties(
    ${FRAMEWORK_NAME} PROPERTIES
    LIBRARY_OUTPUT_DIRECTORY ${PROJECT_SOURCE_DIR}/SampleApp/Frameworks/
    FRAMEWORK ON
    VERSION ${PACKAGE_VERSION}
    FRAMEWORK_VERSION A
    MACOSX_FRAMEWORK_IDENTIFIER ${FRAMEWORK_BUNDLE_IDENTIFIER}
    PUBLIC_HEADER SampleLib.h
)

set(
    CMAKE_SYSTEM_FRAMEWORK_PATH
    ${CMAKE_OSX_SYSROOT}/System/Library/Frameworks
    ${CMAKE_OSX_SYSROOT}/System/Library/PrivateFrameworks
    ${CMAKE_OSX_SYSROOT}/Developer/Library/Frameworks
)
