//
//  ViewController.h
//  bnk-sales-support
//
//  Created by YOUNGRAE SEO on 2020/10/29.
//

#import <UIKit/UIKit.h>

#import "LoadingView.h"

#import "SideMenuViewController.h"

@interface ViewController : UIViewController

@property(strong, atomic) LoadingView *loadingView;

@property(strong,atomic) SideMenuViewController *sideMenuViewController;

@end

