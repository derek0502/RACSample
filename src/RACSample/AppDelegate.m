//
//  AppDelegate.m
//  RACSample
//
//  Created by Derek Cheung on 4/3/2016.
//  Copyright © 2016 Real.co. All rights reserved.
//

#import "AppDelegate.h"

// Controllers
#import "IntroViewController.h"

@interface AppDelegate ()

@property (nonatomic, strong) UINavigationController *navigationController;
@property (nonatomic, strong) Firebase *firebase;

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    // Landing Screen
    [self setupLandingScreen];
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

#pragma mark - Helpers

- (void)setupLandingScreen
{
    UIWindow *window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window = window;
    [self.window makeKeyAndVisible];
    
    
    self.window.rootViewController = self.navigationController;
    [self.navigationController.navigationBar setHidden:YES];
    
    [self updateLandingScreenAnimated:NO];
}

- (void)updateLandingScreenAnimated:(BOOL)animated {
    
    IntroViewController *vc = [[IntroViewController alloc] init];
    [self.navigationController setViewControllers:@[vc] animated:animated];
}

#pragma mark - Accessors

- (UINavigationController *)navigationController
{
    if (!_navigationController) {
        
        _navigationController = [[UINavigationController alloc] init];
    }
    
    return _navigationController;
}

- (Firebase *)firebase {
    
    if (!_firebase) {
        
        _firebase = [[Firebase alloc] initWithUrl:@"https://racsample.firebaseio.com/"];
    }
    
    return _firebase;
}

@end
