//
//  WebBridgeUtil.m
//  bnk-sales-support
//
//  Created by YOUNGRAE SEO on 2020/11/06.
//

#import "WebBridgeUtil.h"

@implementation WebBridgeUtil

+ (void)requestFromNative:(WKWebView *)webView json:(NSString *)json {
    
    [webView evaluateJavaScript:json completionHandler:nil];
    
}

+ (void)onChangePage:(WKWebView *)webView path:(NSString *)path {
    
    [webView evaluateJavaScript:path completionHandler:nil];
    
}

@end
