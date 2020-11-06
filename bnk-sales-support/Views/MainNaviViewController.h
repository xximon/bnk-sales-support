//
//  MainNaviViewController.h
//  bnk-sales-support
//
//  Created by YOUNGRAE SEO on 2020/11/05.
//

#import <UIKit/UIKit.h>
#import "WebNaviViewController.h"
#import "WebViewController.h"
#import "IntroViewController.h"

NS_ASSUME_NONNULL_BEGIN

@interface MainNaviViewController : UINavigationController

@property (strong, nonatomic) WebNaviViewController *webNaviController;

@end

NS_ASSUME_NONNULL_END
