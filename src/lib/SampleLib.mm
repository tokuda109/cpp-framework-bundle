//
// Created by Tsuyoshi Tokuda on 2017/06/26.
//

#import "SampleLib.h"
#import "sample.h"

@interface SampleLib () {
    Sample *sample;
}

@end

@implementation SampleLib

+ (void)world {
}

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
