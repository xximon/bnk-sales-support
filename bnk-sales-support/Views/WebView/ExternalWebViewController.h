//
//  ExternalWebViewController.h
//  bnk-sales-support
//
//  Created by YOUNGRAE SEO on 2020/11/04.
//

#import <UIKit/UIKit.h>
#import <WebKit/WebKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface ExternalWebViewController : UIViewController

//MARK: properties
@property (weak, nonatomic) IBOutlet WKWebView *webView;

@end

NS_ASSUME_NONNULL_END
