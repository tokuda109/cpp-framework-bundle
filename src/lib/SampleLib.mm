//
// Created by Tsuyoshi Tokuda on 2017/06/26.
//

#include "SampleLib.h"

#include "sample.h"

@interface SampleLib () {
    Sample *sample;
}

@end

@implementation SampleLib

- (instancetype)init {
    self = [super init];
    if (self) {
        sample = new Sample();
    }
    return self;
}

- (void)hello {
}

@end
