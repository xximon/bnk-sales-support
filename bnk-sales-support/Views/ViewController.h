//
//  ViewController.h
//  bnk-sales-support
//
//  Created by YOUNGRAE SEO on 2020/10/29.
//

#import <UIKit/UIKit.h>
#import <WebKit/WebKit.h>

#import "LoadingView.h"

#import "WebViewController.h"
#import "SubWebViewController.h"

#import "SideMenuViewController.h"

@interface ViewController : UIViewController

@property(strong, atomic) LoadingView *loadingView;
@property (weak, nonatomic) IBOutlet UIView *practiceView;
@property (weak, nonatomic) IBOutlet UIView *testView;
@property (weak, nonatomic) IBOutlet UITextField *tfServerUrl;
@property (weak, nonatomic) IBOutlet UITextField *tfWebViewUrl;

//@property (weak, nonatomic) IBOutlet WKWebView *webView;
//@property (weak, nonatomic) IBOutlet WKWebView *subWebView;

@property(strong,atomic) WebViewController *webViewController;
@property(strong,atomic) SubWebViewController *subWebViewController;
@property(strong,atomic) SideMenuViewController *sideMenuViewController;

@end

