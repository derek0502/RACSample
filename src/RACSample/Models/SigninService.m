//
//  SigninService.m
//  RACSample
//
//  Created by Derek Cheung on 21/3/2016.
//  Copyright © 2016 Real.co. All rights reserved.
//

#import "SigninService.h"

@implementation SigninService

#pragma mark - Pubilc

+ (RACSignal *)signinWithEmail:(NSString *)email password:(NSString *)password {
    
    return [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
        
        [[DELEGATE firebase] authUser:email password:password withCompletionBlock:^(NSError *error, FAuthData *authData) {
            
            if (error) {
                
                [subscriber sendError:error];
                
            } else {
                
                [subscriber sendNext:authData];
                [subscriber sendCompleted];
            }
            
        }];
        return nil;
    }];
}

@end
