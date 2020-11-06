//
//  SubWebViewController.h
//  bnk-sales-support
//
//  Created by YOUNGRAE SEO on 2020/11/05.
//

#import <UIKit/UIKit.h>
#import <WebKit/WebKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface SubWebViewController : UIViewController <WKNavigationDelegate, WKUIDelegate, WKScriptMessageHandler>

//MARK: properties
@property (strong, nonatomic) WKWebView *webView;
@property(strong, atomic) LoadingView *loadingView;

@end

NS_ASSUME_NONNULL_END
