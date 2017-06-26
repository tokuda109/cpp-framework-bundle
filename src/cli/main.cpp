//
// Created by Tsuyoshi Tokuda on 2017/06/23.
//

#include <iostream>

#include <boost/program_options.hpp>

namespace po = boost::program_options;

int main(int argc, char **argv) {
    po::options_description opt;

    opt.add_options()
        ("help,h", "ヘルプを表示");

    po::variables_map vm;

    try {
        po::store(po::parse_command_line(argc, argv, opt), vm);
    } catch (const po::error_with_option_name &e) {
        std::cerr << e.what() << std::endl;
        return EXIT_FAILURE;
    }

    po::notify(vm);

    if (vm.count("help")) {
        std::cout << opt << std::endl;
    } else {
    }

    return EXIT_SUCCESS;
}
