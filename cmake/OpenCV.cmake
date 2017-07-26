macro(prepare_opencv)

    find_package(OpenCV REQUIRED)

    if (OpenCV_FOUND)
        list(LENGTH OpenCV_LIBS LIBS_LENGTH)
        list(LENGTH OpenCV_LIBRARIES LIBRARIES_LENGTH)

        message(STATUS "OpenCV_VERSION: ${OpenCV_VERSION}")
        message(STATUS "OpenCV_INCLUDE_DIRS: ${OpenCV_INCLUDE_DIRS}")
        message(STATUS "OpenCV_LIBS: ${LIBS_LENGTH} Libraries")
        message(STATUS "OpenCV_LIBRARIES: ${LIBRARIES_LENGTH} Libraries")
        message(STATUS "OpenCV_LIBRARY_DIRS: ${OpenCV_LIBRARY_DIRS}")

        include_directories(${OpenCV_INCLUDE_DIRS})
        link_directories(${OpenCV_LIBRARIES})
    else()
        message(WARNING "Could not find OpenCV.")
    endif()
endmacro()
