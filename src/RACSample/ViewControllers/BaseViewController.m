//
//  BaseViewController.m
//  RACSample
//
//  Created by Derek Cheung on 4/3/2016.
//  Copyright © 2016 Real.co. All rights reserved.
//

#import "BaseViewController.h"

@implementation BaseViewController

#pragma mark - View Lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self bindViewModel];
}

- (void)bindViewModel {
    
    // Override hook
}

@end
