//
//  SigninViewModel.m
//  RACSample
//
//  Created by Derek Cheung on 7/3/2016.
//  Copyright © 2016 Real.co. All rights reserved.
//

#import "SigninViewModel.h"

// Models
#import "SigninService.h"

@implementation SigninViewModel

#pragma mark - Accessors

- (RACSignal *)validEmailSignal {
    
    if (!_validEmailSignal) {
        
        _validEmailSignal =
        [RACObserve(self, email)
         map:^id(NSString *email) {
             
             return @([self isValidEmail:email]);
         }];
    }
    
    return _validEmailSignal;
}

- (RACSignal *)validPasswordSignal {
    
    if (!_validPasswordSignal) {
        
        _validPasswordSignal =
        [RACObserve(self, password)
         map:^id(NSString *password) {
             
             return @([self isValidPassword:password]);
         }];
    }
    
    return _validPasswordSignal;
}

- (RACSignal *)validSigninSignal {
    
    if (!_validSigninSignal) {
        
        _validSigninSignal =
        [RACSignal
         combineLatest:@[self.validEmailSignal, self.validPasswordSignal]
         reduce:^id(NSNumber *emailValid, NSNumber *passwordValid) {
             
             return @([emailValid boolValue] && [passwordValid boolValue]);
         }];
    }
    
    return _validSigninSignal;
}

- (RACCommand *)signinCommand {
    
    if (!_signinCommand) {
        
        _signinCommand = [[RACCommand alloc]
                          initWithEnabled:self.validSigninSignal
                          signalBlock:^RACSignal *(id input) {
                              
                              return [SigninService signinWithEmail:self.email password:self.password];
                          }];
    }
    
    return _signinCommand;
}

#pragma mark - Helpers

- (BOOL)isValidEmail:(NSString *)email {
    
    BOOL stricterFilter = NO;
    NSString *stricterFilterString = @"^[A-Z0-9a-z\\._%+-]+@([A-Za-z0-9-]+\\.)+[A-Za-z]{2,4}$";
    NSString *laxString = @"^.+@([A-Za-z0-9-]+\\.)+[A-Za-z]{2}[A-Za-z]*$";
    NSString *emailRegex = stricterFilter ? stricterFilterString : laxString;
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    return [emailTest evaluateWithObject:email];
}

- (BOOL)isValidPassword:(NSString *)password {
    
    return ([password length] > 3);
}

@end
