//
//  WebViewController.h
//  bnk-sales-support
//
//  Created by YOUNGRAE SEO on 2020/10/29.
//

#import <UIKit/UIKit.h>
#import <WebKit/WebKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface WebViewController : UIViewController <WKNavigationDelegate, WKUIDelegate, WKScriptMessageHandler>

//MARK: properties
@property (weak, nonatomic) WKWebView *webView;

@end

NS_ASSUME_NONNULL_END
