//
//  SigninService.h
//  RACSample
//
//  Created by Derek Cheung on 21/3/2016.
//  Copyright © 2016 Real.co. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SigninService : NSObject

+ (RACSignal *)signinWithEmail:(NSString *)email password:(NSString *)password;

@end
