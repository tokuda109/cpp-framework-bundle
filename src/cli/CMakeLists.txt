cmake_minimum_required(VERSION 3.8.2 FATAL_ERROR)

include(Boost)

prepare_boost()

add_executable(cli main.cpp)

include_directories(../lib)

target_link_libraries(cli ${FRAMEWORK_NAME})

if (Boost_FOUND)
    target_link_libraries(cli ${Boost_LIBRARIES})
endif()
