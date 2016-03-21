//
//  BaseViewModel.m
//  RACSample
//
//  Created by Derek Cheung on 4/3/2016.
//  Copyright © 2016 Real.co. All rights reserved.
//

#import "BaseViewModel.h"

@implementation BaseViewModel

#pragma mark - Initialization

- (instancetype)init {

    if (self = [super init]) {
        
        [self setup];
    }
    return self;
}

#pragma mark - Setup

- (void)setup {
    
    // Override hook
}

@end
