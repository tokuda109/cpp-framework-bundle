//
// Created by Tsuyoshi Tokuda on 2017/06/26.
//

#include <iostream>

#import "SampleLib.h"
#import "sample.h"

@interface SampleLib () {
    Sample *sample;
}

@end

@implementation SampleLib

+ (void)world {
    std::cout << "world" << std::endl;
}

- (instancetype)init {
    self = [super init];
    if (self) {
        sample = new Sample();
    }
    return self;
}

- (void)hello {
std::cout << "hello" << std::endl;
}

@end
