
#include <iostream>

#include <opencv2/core.hpp>

#include "sample.h"

Sample::Sample() {
}

void Sample::hello() {
    // std::cout << cv::format("HELLO %.0f", 1.2) << std::endl;
    std::cout << "Hello!" << std::endl;
    std::cout << CV_MAJOR_VERSION << std::endl;
}
