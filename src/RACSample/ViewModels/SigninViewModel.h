//
//  SigninViewModel.h
//  RACSample
//
//  Created by Derek Cheung on 7/3/2016.
//  Copyright © 2016 Real.co. All rights reserved.
//

#import "BaseViewModel.h"

@interface SigninViewModel : BaseViewModel

@property (nonatomic, strong) NSString *email;
@property (nonatomic, strong) NSString *password;

@property (nonatomic, strong) RACSignal *validEmailSignal;
@property (nonatomic, strong) RACSignal *validPasswordSignal;
@property (nonatomic, strong) RACSignal *validSigninSignal;
@property (nonatomic, strong) RACCommand *signinCommand;
@property (nonatomic, strong) RACSubject *signinSubject;

@end
