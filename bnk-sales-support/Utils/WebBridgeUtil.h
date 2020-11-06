//
//  WebBridgeUtil.h
//  bnk-sales-support
//
//  Created by YOUNGRAE SEO on 2020/11/06.
//

#import <Foundation/Foundation.h>
#import <WebKit/WebKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface WebBridgeUtil : NSObject

// MARK: NATIVE -> WEB 데이터 전송 메소드
+(void)requestFromNative:(WKWebView *)webView json:(NSString *)json;
+(void)onChangePage:(WKWebView *)webView path:(NSString *)path;

@end

NS_ASSUME_NONNULL_END
