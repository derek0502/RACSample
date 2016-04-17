//
//  SigninViewController.m
//  RACSample
//
//  Created by Derek Cheung on 4/3/2016.
//  Copyright © 2016 Real.co. All rights reserved.
//

#import "SigninViewController.h"

// Views
#import "SigninView.h"

@interface SigninViewController ()

@property (nonatomic, strong) SigninView *view;
@property (nonatomic, strong) RACSignal *validEmailSignal;
@property (nonatomic, strong) RACSignal *validPasswordSignal;
@property (nonatomic, strong) SigninViewModel *viewModel;

@end

@implementation SigninViewController

@dynamic view;

#pragma mark - Initialization

- (instancetype)initWithViewModel:(SigninViewModel *)viewModel {
    
    if (self = [self init]) {
        
        _viewModel = viewModel;
    }
    
    return self;
}

#pragma mark - View Lifecycle

- (void)loadView {
    
    self.view = [SigninView new];
}

#pragma mark - Bind ViewModel

- (void)bindViewModel {
    
    // Email
    RACChannelTerminal *modelEmailTerminal = RACChannelTo(self.viewModel, email);
    RACChannelTerminal *myEmailTerminal = self.view.emailTextField.rac_newTextChannel;
    [modelEmailTerminal subscribe:myEmailTerminal];
    [myEmailTerminal subscribe:modelEmailTerminal];
    
    RAC(self.view.emailTextField, textFieldColor) =
    [self.viewModel.validEmailSignal
     map:^id(NSNumber *isValid) {
         
         return [isValid boolValue] ? [UIColor turquoiseColor] : [UIColor wetAsphaltColor];
     }];
    
    // Password
    RACChannelTerminal *modelPasswordTerminal = RACChannelTo(self.viewModel, password);
    RACChannelTerminal *myPasswordTerminal = self.view.passwordTextField.rac_newTextChannel;
    [modelPasswordTerminal subscribe:myPasswordTerminal];
    [myPasswordTerminal subscribe:modelPasswordTerminal];
    
    RAC(self.view.passwordTextField, textFieldColor) =
    [self.viewModel.validPasswordSignal
     map:^id(NSNumber *isValid) {
         
         return [isValid boolValue] ? [UIColor turquoiseColor] : [UIColor wetAsphaltColor];
     }];
    
    // Button
    self.view.signinButton.rac_command = self.viewModel.signinCommand;
    
    [self.view.signinButton.rac_command.executing
     subscribeNext:^(NSNumber *executing) {
         
         if ([executing boolValue]) {
             
             [self.view.signinButton setTitle:@"Loading..." forState:UIControlStateNormal];
         }
     }];
    
    [[self.viewModel.signinCommand.executionSignals flatten]
     subscribeNext:^(FAuthData *authData) {
         
         [self.view.signinButton setTitle:@"Success!" forState:UIControlStateNormal];
     }];
    
    [self.viewModel.signinCommand.errors subscribeNext:^(NSError *error) {
        
        [self.view.signinButton setTitle:@"Fail!" forState:UIControlStateNormal];
    }];
}

@end
