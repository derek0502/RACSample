//
//  SigninView.h
//  RACSample
//
//  Created by Derek Cheung on 4/3/2016.
//  Copyright © 2016 Real.co. All rights reserved.
//

#import "BaseView.h"

@interface SigninView : BaseView

@property (nonatomic, strong) FUITextField *emailTextField;
@property (nonatomic, strong) FUITextField *passwordTextField;
@property (nonatomic, strong) FUIButton *signinButton;

@end
