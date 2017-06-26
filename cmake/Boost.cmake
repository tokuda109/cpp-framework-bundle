macro(prepare_boost)

    find_package(Boost REQUIRED COMPONENTS program_options thread system timer)

    if (Boost_FOUND)
        # message(STATUS "Boost version: ${Boost_MAJOR_VERSION}.${Boost_MINOR_VERSION}.${Boost_SUBMINOR_VERSION}")
    else()
        message(WARNING "Could not find Boost.")
    endif()
endmacro()