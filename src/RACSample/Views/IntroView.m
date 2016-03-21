//
//  IntroView.m
//  RACSample
//
//  Created by Derek Cheung on 4/3/2016.
//  Copyright © 2016 Real.co. All rights reserved.
//

#import "IntroView.h"

@implementation IntroView

#pragma mark - Setup

- (void)setup {
    
    [super setup];
    
    self.backgroundColor = [UIColor whiteColor];
    [self setupSignupButton];
    [self setupSigninButton];
}

- (void)setupSignupButton {
    
    _signupButton = [FUIButton newAutoLayoutView];
    
    [_signupButton setTitle:@"Sign up" forState:UIControlStateNormal];
    _signupButton.buttonColor = [UIColor turquoiseColor];
    _signupButton.shadowColor = [UIColor greenSeaColor];
    _signupButton.shadowHeight = 3.0f;
    _signupButton.cornerRadius = 6.0f;
    _signupButton.titleLabel.font = [UIFont boldFlatFontOfSize:16];
    [_signupButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [_signupButton setTitleColor:[UIColor whiteColor] forState:UIControlStateHighlighted];
    
    [self addSubview:_signupButton];
}

- (void)setupSigninButton {
    
    _signinButton = [FUIButton newAutoLayoutView];
    
    [_signinButton setTitle:@"Sign in" forState:UIControlStateNormal];
    _signinButton.buttonColor = [UIColor concreteColor];
    _signinButton.shadowColor = [UIColor asbestosColor];
    _signinButton.shadowHeight = 3.0f;
    _signinButton.cornerRadius = 6.0f;
    _signinButton.titleLabel.font = [UIFont boldFlatFontOfSize:16];
    [_signinButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [_signinButton setTitleColor:[UIColor whiteColor] forState:UIControlStateHighlighted];
    
    [self addSubview:_signinButton];
}

#pragma mark - Setup Constraints

- (void)setupConstraints {
    
    [super setupConstraints];
    
    [self setupSignupButtonConstraints];
    [self setupSigninButtonConstraints];
}

- (void)setupSignupButtonConstraints {
    
    [_signupButton autoSetDimension:ALDimensionHeight toSize:40.0];
    [_signupButton autoAlignAxisToSuperviewAxis:ALAxisHorizontal];
    [_signupButton autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:40.0];
}

- (void)setupSigninButtonConstraints {
    
    [_signinButton autoSetDimension:ALDimensionHeight toSize:40.0];
    [_signinButton autoMatchDimension:ALDimensionWidth toDimension:ALDimensionWidth ofView:_signupButton];
    [_signinButton autoAlignAxisToSuperviewAxis:ALAxisHorizontal];
    [_signinButton autoPinEdge:ALEdgeLeft toEdge:ALEdgeRight ofView:_signupButton withOffset:20.0];
    [_signinButton autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:40.0];
}

@end
