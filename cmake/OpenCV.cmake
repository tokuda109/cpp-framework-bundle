macro(prepare_opencv)
    set(OpenCV_DIR "/usr/local/share/OpenCV/")

    find_package(OpenCV REQUIRED)

    if (OpenCV_FOUND)
        message(STATUS "OpenCV version: ${OpenCV_VERSION}")

        include_directories(${OpenCV_INCLUDE_DIRS})
        link_directories(${OpenCV_LIBS})
    else()
        message(WARNING "Could not find OpenCV.")
    endif()
endmacro()
