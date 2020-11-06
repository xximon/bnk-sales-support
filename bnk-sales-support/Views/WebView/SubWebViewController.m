//
//  SubWebViewController.m
//  bnk-sales-support
//
//  Created by YOUNGRAE SEO on 2020/11/05.
//

#import "SubWebViewController.h"

@interface SubWebViewController (){
    
    WKWebViewConfiguration *config;
    WKUserContentController *jsctrl;
    WKProcessPool *processPool;
    
}

@end

@implementation SubWebViewController

//MARK: Life Cycle
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(showSubWebView) name:@"SHOW_SUB_WEBVIEW" object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(closeSubWebView) name:@"CLOSE_SUB_WEBVIEW" object:nil];
    
    [self initView];
    [self initListener];
}

- (void)viewDidLayoutSubviews{
    [self.webView loadRequest:[self getUrlRequest]];
}

- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self name:@"SHOW_SUB_WEBVIEW" object:nil];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:@"CLOSE_SUB_WEBVIEW" object:nil];
}

//MARK: Initialize
-(void)initView {
//    [self.view setHidden:YES];
    
    [self initWebViewSetting];
    
    self.webView = [[WKWebView alloc]initWithFrame:self.view.frame configuration:config];
//    self.webView = [[WKWebView alloc]initWithFrame:self.view.frame];
    self.webView.UIDelegate = self;
    self.webView.navigationDelegate = self;
    self.webView.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view addSubview:self.webView];
    
    [[self.webView.leadingAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.leadingAnchor] setActive:YES];
    [[self.webView.topAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.topAnchor] setActive:YES];
    [[self.webView.trailingAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.trailingAnchor] setActive:YES];
    [[self.webView.bottomAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.bottomAnchor] setActive:YES];
    
}

-(void)initListener {
    
}

-(void)initWebBridge {
    
}

-(void)initWebViewSetting {
    processPool = [[WKProcessPool alloc] init];
    config = [[WKWebViewConfiguration alloc]init];
    jsctrl = [[WKUserContentController alloc]init];
    
    [config setUserContentController:jsctrl];
    
    config.processPool = processPool;
    config.preferences.javaScriptCanOpenWindowsAutomatically = YES;
    
    [self initWebBridge];
}

-(NSURLRequest *)getUrlRequest {
    NSString *strUrl = @"https://www.naver.com";
    NSURLRequest *request = [[NSURLRequest alloc] initWithURL:[NSURL URLWithString:strUrl]];
    return request;
}

#pragma mark - Notifications

-(void)showSubWebView {
    [self.view setHidden:NO];
}

-(void)closeSubWebView {
    [self.view setHidden:YES];
}
#pragma mark - WKNavigationDelegate

#pragma mark - WKScriptMessageHandler

#pragma mark - WKUIDelegate

@end
