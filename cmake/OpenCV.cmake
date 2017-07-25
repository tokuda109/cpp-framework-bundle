macro(prepare_opencv)

    find_package(OpenCV REQUIRED)

    if (OpenCV_FOUND)
        message(STATUS "OpenCV_VERSION: ${OpenCV_VERSION}")
        message(STATUS "OpenCV_INCLUDE_DIRS: ${OpenCV_INCLUDE_DIRS}")
        message(STATUS "OpenCV_LIBS: ${OpenCV_LIBS}")

        include_directories(${OpenCV_INCLUDE_DIRS})
        link_directories(${OpenCV_LIBS})
    else()
        message(WARNING "Could not find OpenCV.")
    endif()
endmacro()
