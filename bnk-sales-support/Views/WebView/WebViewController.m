//
//  WebViewController.m
//  bnk-sales-support
//
//  Created by YOUNGRAE SEO on 2020/10/29.
//

#import "WebViewController.h"

@interface WebViewController (){
    
    WKWebViewConfiguration *config;
    WKUserContentController *jsctrl;
    WKProcessPool *processPool;
    
}

@end

@implementation WebViewController{
    //MARK: properties
    
}



//MARK: Life Cycle
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    [self initView];
    [self initListener];
}

- (void)viewDidLayoutSubviews{
    [self.webView loadRequest:[self getUrlRequest]];
}


//MARK: Initialize
-(void)initView {
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

-(void)initWebViewSetting {
    processPool = [[WKProcessPool alloc] init];
    config = [[WKWebViewConfiguration alloc]init];
    jsctrl = [[WKUserContentController alloc]init];
    
    [config setUserContentController:jsctrl];
    
    config.processPool = processPool;
    config.preferences.javaScriptCanOpenWindowsAutomatically = YES;
}

-(NSURLRequest *)getUrlRequest {
    NSString *strUrl = @"https://www.naver.com";
    NSURLRequest *request = [[NSURLRequest alloc] initWithURL:[NSURL URLWithString:strUrl]];
    return request;
}


#pragma mark - WKNavigationDelegate

- (void)webView:(WKWebView *)webView didFailProvisionalNavigation:(WKNavigation *)navigation withError:(NSError *)error{
    if(error!=nil)
    {
        if( error.code == -1001 ) {
            // TIMED OUT:
            //NSString *title = @"E9PAY";
            //NSString *message = @"페이지를 로드하지 못 했습니다.(Time out)";
            //[self showAlertWithTitle:title message:message onPositive:^{}];
            // CODE to handle TIMEOUT
        } else if( error.code == -1003 ){
            // SERVER CANNOT BE FOUND
            // CODE to handle SERVER not found
        } else if( error.code == -1100 ){
            // URL NOT FOUND ON SERVER
            // CODE to handle URL not found
        } else {
            
        }
        
        NSLog(@"==========%@=====error code:%ld", webView.URL, (long)error.code);
    }
}

- (void)webView:(WKWebView *)webView didCommitNavigation:(WKNavigation *)navigation{
    NSLog(@"== 1. didCommitNavigation");
}

- (void)webView:(WKWebView *)webView didFinishNavigation:(WKNavigation *)navigation{
    NSLog(@"== 2. didFinishNavigation");
}

- (void)webView:(WKWebView *)webView didFailNavigation:(WKNavigation *)navigation withError:(NSError *)error{
    NSLog(@"== 3. didFailNavigation");
}

#pragma mark - WKScriptMessageHandler
- (void)userContentController:(WKUserContentController *)userContentController didReceiveScriptMessage:(WKScriptMessage *)message{
    NSLog(@"=== [WEB -> NATIVE] didReceiveScriptMessage Name : %@", message.name);
    NSLog(@"=== [WEB -> NATIVE] didReceiveScriptMessage Body : %@", message.body);
    
    // WEB -> NATIVE 호출 제어
    if (message) {
        NSError* error;
        NSData *data = [message.body dataUsingEncoding:NSUTF8StringEncoding allowLossyConversion:YES] ;
        NSDictionary* json = [NSJSONSerialization JSONObjectWithData:data
                                                             options:(NSJSONReadingOptions) NSJSONWritingPrettyPrinted
                                                               error:&error];
        if(json == nil){
            return;
        }
        
        NSString *strCommand = json[@"command"];
        if (strCommand == nil || strCommand.length == 0) {
            return;
        }
        
        
        
        // 1. 로딩 에니메이션 Show
        if([strCommand isEqualToString:@"START_LOADING"]){
            
        }
        // 2. 로딩 에니메이션 Hide
        if([strCommand isEqualToString:@"END_LOADING"]){
            
        }
        // 3. 화면 전환 모드(NATIVE, WEB)
        if([strCommand isEqualToString:@"CHANGE_MODE"]){
            // 1) NATIVE: 네이티브 화면 표시
            // 2) WEB: 웹뷰 화면 표시
        }
        // 4. 네이티브 메뉴 (SHOW, HIDE)
        if([strCommand isEqualToString:@"OPEN_MENU"]){
            // 1) SHOW: 네이티브 메뉴 표시
            // 2) HIDE: 네이티브 메뉴 숨김
            
        }
        // 5. 웹뷰 show (SUB, EXTERNAL)
        if([strCommand isEqualToString:@"OPEN_WEBVIEW"]){
            // 1) SUB: 서브 웹뷰로 이동
            // 2) EXTERNAL: 외부 (다른 브라우저) 로 이동
        }
    }
}

#pragma mark - WKUIDelegate

@end
