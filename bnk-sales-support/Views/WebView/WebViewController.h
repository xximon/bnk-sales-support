//
//  WebViewController.h
//  bnk-sales-support
//
//  Created by YOUNGRAE SEO on 2020/10/29.
//

#import <UIKit/UIKit.h>
#import <WebKit/WebKit.h>

#import "LoadingView.h"

NS_ASSUME_NONNULL_BEGIN

@interface WebViewController : UIViewController <WKNavigationDelegate, WKUIDelegate, WKScriptMessageHandler>

//MARK: properties
@property (strong, nonatomic) WKWebView *webView;
@property(strong, atomic) LoadingView *loadingView;

@end

NS_ASSUME_NONNULL_END
