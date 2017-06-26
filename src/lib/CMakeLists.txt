
set(CMAKE_C_FLAGS "-x objective-c")
set(CMAKE_CXX_FLAGS "-x objective-c++")

add_library(
    SampleLib SHARED
    SampleLib.h
    SampleLib.mm
    sample.h
    sample.cpp
)

set_target_properties(
    SampleLib PROPERTIES
    LIBRARY_OUTPUT_DIRECTORY ${PROJECT_SOURCE_DIR}/SampleApp/Frameworks/
    FRAMEWORK ON
    VERSION ${PACKAGE_VERSION}
    FRAMEWORK_VERSION A
    MACOSX_FRAMEWORK_IDENTIFIER com.cpp-framework-bundle
    PUBLIC_HEADER SampleLib.h
    XCODE_ATTRIBUTE_CODE_SIGN_IDENTITY "iPhone Developer"
)

target_link_libraries(
    SampleLib
    "-framework Foundation"
)
