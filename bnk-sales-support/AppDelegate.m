//
//  AppDelegate.m
//  bnk-sales-support
//
//  Created by YOUNGRAE SEO on 2020/10/29.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    return YES;
}

-(void)doInit{
    UIViewController *viewController = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"main"];
    [self changeRootView:viewController];
}

-(void)changeRootView:(UIViewController *)vc{
    self.window = [[UIWindow alloc] initWithFrame:UIScreen.mainScreen.bounds];
    self.window.rootViewController = vc;
    [self.window makeKeyAndVisible];

    // transition 주지 않을 때 black screen 나타나는 현상이 있음
    [UIView transitionWithView:self.window duration:0.3
                       options:UIViewAnimationOptionTransitionCrossDissolve
                    animations:nil
                    completion:nil];
}

@end
