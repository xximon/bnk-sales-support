//
//  AppDelegate.h
//  bnk-sales-support
//
//  Created by YOUNGRAE SEO on 2020/10/29.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>
#import "MainNaviViewController.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (strong, nonatomic) NSString *serverUrl;
@property (strong, nonatomic) NSString *webViewUrl;

@property (strong, nonatomic) MainNaviViewController *mainNaviViewController;

//@property (readonly, strong) NSPersistentContainer *persistentContainer;


- (void)saveContext;


@end

