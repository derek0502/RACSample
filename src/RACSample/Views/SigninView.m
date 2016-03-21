//
//  SigninView.m
//  RACSample
//
//  Created by Derek Cheung on 4/3/2016.
//  Copyright © 2016 Real.co. All rights reserved.
//

#import "SigninView.h"

@interface SigninView ()

@property (nonatomic, strong) UIView *containerView;

@end

@implementation SigninView

#pragma mark - Setup

- (void)setup {
    
    [super setup];
    
    self.backgroundColor = [UIColor whiteColor];
    [self setupContainerView];
    [self setupEmailTextField];
    [self setupPasswordTextField];
    [self setupSigninButton];
}

- (void)setupContainerView {
    
    _containerView = [UIView newAutoLayoutView];
    
    [self addSubview:_containerView];
}

- (void)setupEmailTextField {
    
    _emailTextField = [FUITextField newAutoLayoutView];
    
    _emailTextField.placeholder = @"Email";
    _emailTextField.textColor = [UIColor whiteColor];
    _emailTextField.font = [UIFont flatFontOfSize:16];
    _emailTextField.backgroundColor = [UIColor clearColor];
    _emailTextField.edgeInsets = UIEdgeInsetsMake(4.0f, 15.0f, 4.0f, 15.0f);
    _emailTextField.textFieldColor = [UIColor whiteColor];
    _emailTextField.borderColor = [UIColor turquoiseColor];
    _emailTextField.borderWidth = 2.0f;
    _emailTextField.cornerRadius = 3.0f;
    _emailTextField.autocapitalizationType = UITextAutocapitalizationTypeNone;
    _emailTextField.keyboardType = UIKeyboardTypeEmailAddress;
    
    [_containerView addSubview:_emailTextField];
}

- (void)setupPasswordTextField {
    
    _passwordTextField = [FUITextField newAutoLayoutView];
    
    _passwordTextField.placeholder = @"Password";
    _passwordTextField.textColor = [UIColor whiteColor];
    _passwordTextField.font = [UIFont flatFontOfSize:16];
    _passwordTextField.backgroundColor = [UIColor clearColor];
    _passwordTextField.edgeInsets = UIEdgeInsetsMake(4.0f, 15.0f, 4.0f, 15.0f);
    _passwordTextField.textFieldColor = [UIColor whiteColor];
    _passwordTextField.borderColor = [UIColor turquoiseColor];
    _passwordTextField.borderWidth = 2.0f;
    _passwordTextField.cornerRadius = 3.0f;
    _passwordTextField.autocapitalizationType = UITextAutocapitalizationTypeNone;
    _passwordTextField.secureTextEntry = YES;
    
    [_containerView addSubview:_passwordTextField];
}

- (void)setupSigninButton {
    
    _signinButton = [FUIButton newAutoLayoutView];
    
    [_signinButton setTitle:@"Sign in" forState:UIControlStateNormal];
    _signinButton.buttonColor = [UIColor turquoiseColor];
    _signinButton.shadowColor = [UIColor greenSeaColor];
    _signinButton.shadowHeight = 3.0f;
    _signinButton.cornerRadius = 6.0f;
    _signinButton.titleLabel.font = [UIFont boldFlatFontOfSize:16];
    [_signinButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [_signinButton setTitleColor:[UIColor whiteColor] forState:UIControlStateHighlighted];
    
    [_containerView addSubview:_signinButton];
}

#pragma mark - Setup Constraints

- (void)setupConstraints {
    
    [super setupConstraints];
    
    [self setupContainerViewConstraints];
    [self setupEmailTextFieldConstraints];
    [self setupPasswordTextFieldConstraints];
    [self setupSigninButtonConstraints];
}

- (void)setupContainerViewConstraints {
    
    [_containerView autoAlignAxisToSuperviewAxis:ALAxisHorizontal];
    [_containerView autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:40.0];
    [_containerView autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:40.0];
}

- (void)setupEmailTextFieldConstraints {
    
    [_emailTextField autoSetDimension:ALDimensionHeight toSize:50.0];
    [_emailTextField autoPinEdgeToSuperviewEdge:ALEdgeTop];
    [_emailTextField autoPinEdgeToSuperviewEdge:ALEdgeLeft];
    [_emailTextField autoPinEdgeToSuperviewEdge:ALEdgeRight];
}

- (void)setupPasswordTextFieldConstraints {
    
    [_passwordTextField autoSetDimension:ALDimensionHeight toSize:50.0];
    [_passwordTextField autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:_emailTextField withOffset:20.0];
    [_passwordTextField autoPinEdgeToSuperviewEdge:ALEdgeLeft];
    [_passwordTextField autoPinEdgeToSuperviewEdge:ALEdgeRight];
}

- (void)setupSigninButtonConstraints {
    
    [_signinButton autoSetDimensionsToSize:CGSizeMake(100.0, 40.0)];
    [_signinButton autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:_passwordTextField withOffset:20.0];
    [_signinButton autoPinEdgeToSuperviewEdge:ALEdgeBottom];
    [_signinButton autoAlignAxisToSuperviewAxis:ALAxisVertical];
}

@end
