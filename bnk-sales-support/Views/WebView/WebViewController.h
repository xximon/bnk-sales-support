//
//  WebViewController.h
//  bnk-sales-support
//
//  Created by YOUNGRAE SEO on 2020/10/29.
//

#import <UIKit/UIKit.h>
#import <WebKit/WebKit.h>

#import "LoadingView.h"

#import "SubWebViewController.h"

NS_ASSUME_NONNULL_BEGIN

@protocol WebViewControllerDelegate <NSObject>

@optional
- (void)didFinishedLoadWebView:(BOOL)animated;

@end

@interface WebViewController : UIViewController <WKNavigationDelegate, WKUIDelegate, WKScriptMessageHandler>

//MARK: properties
@property (strong, nonatomic) WKWebView *webView;
@property(strong, atomic) LoadingView *loadingView;

@property (weak, nonatomic) id<WebViewControllerDelegate>webViewDelegate;




@end

NS_ASSUME_NONNULL_END
