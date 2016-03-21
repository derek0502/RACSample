//
//  SigninViewController.h
//  RACSample
//
//  Created by Derek Cheung on 4/3/2016.
//  Copyright © 2016 Real.co. All rights reserved.
//

#import "BaseViewController.h"

// ViewModels
#import "SigninViewModel.h"

@interface SigninViewController : BaseViewController

@property (nonatomic, strong, readonly) RACSignal *validEmailSignal;

- (instancetype)initWithViewModel:(SigninViewModel *)viewModel;

@end
