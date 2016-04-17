//
//  IntroViewController.m
//  RACSample
//
//  Created by Derek Cheung on 4/3/2016.
//  Copyright © 2016 Real.co. All rights reserved.
//

#import "IntroViewController.h"

// Views
#import "IntroView.h"

// Controllers
#import "SigninViewController.h"

// ViewModels
#import "SigninViewModel.h"

@interface IntroViewController ()

@property (nonatomic, strong) IntroView *view;

@end

@implementation IntroViewController

@dynamic view;

#pragma mark - View Lifecycle

- (void)loadView {
    
    self.view = [IntroView new];
}

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    [self setupSignupButtonActions];
    [self setupSigninButtonActions];
    
}

#pragma mark - Actions

- (void)setupSignupButtonActions {
    
    [[self.view.signupButton rac_signalForControlEvents:UIControlEventTouchUpInside]
     subscribeNext:^(id x) {
         
     }];
}

- (void)setupSigninButtonActions {
    
    [[self.view.signinButton rac_signalForControlEvents:UIControlEventTouchUpInside]
     subscribeNext:^(id x) {
         
         SigninViewModel *vm = [SigninViewModel new];
         SigninViewController *vc = [[SigninViewController alloc] initWithViewModel:vm];
         [self.navigationController setViewControllers:@[vc] animated:YES];
     }];
}

@end
