cmake_minimum_required(VERSION 3.8.2 FATAL_ERROR)

# @see https://stackoverflow.com/a/41024413
# @see https://stackoverflow.com/questions/41737334/compiling-dylib-file-for-ios-with-cmake
# @see https://github.com/cristeab/ios-cmake
# @see https://github.com/leetal/ios-cmake
# @see https://github.com/ruslo/polly
# @see http://flat-leon.hatenablog.com/entry/alure_ios

set(CMAKE_SHARED_LINKER_FLAGS "-Wall")

set(CMAKE_SYSTEM_NAME Darwin)
set(UNIX True)
set(APPLE True)

set(CMAKE_SHARED_LIBRARY_PREFIX "lib")
set(CMAKE_SHARED_LIBRARY_SUFFIX ".dylib")
set(CMAKE_SHARED_MODULE_PREFIX "lib")
set(CMAKE_SHARED_MODULE_SUFFIX ".so")
set(CMAKE_MODULE_EXISTS 1)
set(CMAKE_DL_LIBS "")

set(CMAKE_MACOSX_BUNDLE True)
set(CMAKE_FIND_LIBRARY_SUFFIXES ".dylib" ".so" ".a")

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
    XCODE_ATTRIBUTE_CODE_SIGN_IDENTITY ${CODE_SIGN_IDENTITY}
    XCODE_ATTRIBUTE_GCC_PRECOMPILE_PREFIX_HEADER "YES"
    XCODE_ATTRIBUTE_IPHONEOS_DEPLOYMENT_TARGET ${IPHONEOS_DEPLOYMENT_TARGET}
    XCODE_ATTRIBUTE_LD_RUNPATH_SEARCH_PATHS "@executable_path/Frameworks"
)

# Set the find root to the iOS developer roots and to user defined paths
# https://cmake.org/cmake/help/v3.9/variable/CMAKE_FIND_ROOT_PATH.html
set(
    CMAKE_FIND_ROOT_PATH
    ${CMAKE_IOS_DEVELOPER_ROOT}
    ${CMAKE_IOS_SDK_ROOT}
    CACHE string "iOS find search path root"
)

# default to searching for frameworks first
# https://cmake.org/cmake/help/v3.9/variable/CMAKE_FIND_FRAMEWORK.html
set(CMAKE_FIND_FRAMEWORK FIRST)

# https://cmake.org/cmake/help/v3.9/variable/CMAKE_SYSTEM_FRAMEWORK_PATH.html
set(
    CMAKE_SYSTEM_FRAMEWORK_PATH
    ${CMAKE_OSX_SYSROOT}/System/Library/Frameworks
    ${CMAKE_OSX_SYSROOT}/System/Library/PrivateFrameworks
    ${CMAKE_OSX_SYSROOT}/Developer/Library/Frameworks
)

set(CMAKE_FIND_ROOT_PATH_MODE_PROGRAM ONLY)
set(CMAKE_FIND_ROOT_PATH_MODE_LIBRARY ONLY)
set(CMAKE_FIND_ROOT_PATH_MODE_INCLUDE ONLY)

# target_link_libraries(
#     SampleLib
#     "-framework Foundation"
# )

# find_library(FOUNDATION Foundation)
# add_executable()
# target_link_libraries(SampleLib ${FOUNDATION})
