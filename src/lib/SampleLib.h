
#import <Foundation/Foundation.h>

//! Project version number for Lib.
FOUNDATION_EXPORT double SampleLibVersionNumber;

//! Project version string for Lib.
FOUNDATION_EXPORT const unsigned char SampleLibVersionString[];

#ifndef CPP_FRAMEWORK_BUNDLE_SAMPLELIB_H
#define CPP_FRAMEWORK_BUNDLE_SAMPLELIB_H

@interface SampleLib : NSObject

- (instancetype)init;

- (void)hello;

@end

#endif //CPP_FRAMEWORK_BUNDLE_SAMPLELIB_H
