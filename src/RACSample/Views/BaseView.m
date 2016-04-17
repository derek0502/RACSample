//
//  BaseView.m
//  RACSample
//
//  Created by Derek Cheung on 4/3/2016.
//  Copyright © 2016 Real.co. All rights reserved.
//

#import "BaseView.h"

@implementation BaseView

#pragma mark - Initialization

- (instancetype)init {
    
    if (self = [super init]) {
        
        [self setup];
        [self setupConstraints];
    }
    return self;
}

#pragma mark - Setup

- (void)setup {
    
    // Override hook
}

#pragma mark - Setup Constraints

- (void)setupConstraints {
    
    // Override hook
}

@end