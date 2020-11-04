//
//  WebViewController.m
//  bnk-sales-support
//
//  Created by YOUNGRAE SEO on 2020/10/29.
//

#import "WebViewController.h"

@interface WebViewController ()

@end

@implementation WebViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    [self initView];
    [self initListener];
}

-(void)initView {
    self.webView = [[WKWebView alloc]initWithFrame:self.view.bounds];
    self.webView.navigationDelegate = self;
    [self.view addSubview:self.webView];
    
    [self initWebViewSetting];
}
-(void)initListener {
    
}

-(void)initWebViewSetting {
    [self.webView loadRequest:[self getUrlRequest]];
}

-(NSURLRequest *)getUrlRequest {
    NSString *strUrl = @"https://www.naver.com";
    NSURLRequest *request = [[NSURLRequest alloc] initWithURL:[NSURL URLWithString:strUrl]];
    return request;
}


#pragma mark - WKNavigationDelegate

- (void)webView:(WKWebView *)webView didCommitNavigation:(WKNavigation *)navigation{

}

- (void)webView:(WKWebView *)webView didFinishNavigation:(WKNavigation *)navigation{

}

- (void)webView:(WKWebView *)webView didFailNavigation:(WKNavigation *)navigation withError:(NSError *)error{

}

#pragma mark - WKScriptMessage Delegate

@end
