
#include <iostream>

#include <opencv2/core.hpp>

#include "sample.h"

Sample::Sample() {
}

void Sample::hello() {
    std::cout << "Hello!" << std::endl;
    std::cout << "OpenCV ver: " << CV_MAJOR_VERSION << "." << CV_VERSION_MINOR << "." << CV_VERSION_REVISION << std::endl;

    // cv::Algorithm al;

    std::cout << cv::COVAR_SCRAMBLED << std::endl;
}
