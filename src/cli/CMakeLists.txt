
include(Boost)

prepare_boost()

add_executable(cli main.cpp)

if (Boost_FOUND)
    target_link_libraries(cli ${Boost_LIBRARIES})
endif()
