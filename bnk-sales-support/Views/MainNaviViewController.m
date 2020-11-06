//
//  MainNaviViewController.m
//  bnk-sales-support
//
//  Created by YOUNGRAE SEO on 2020/11/05.
//

#import "MainNaviViewController.h"

@interface MainNaviViewController ()

@end

@implementation MainNaviViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}



#pragma mark - 메인 네비게이션 초기화
-(void)rootViewControllerInitialize {
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];
    IntroViewController *introViewController = [storyboard instantiateViewControllerWithIdentifier:@"IntroViewController"];
    self.viewControllers = @[introViewController];
}


#pragma mark - 웹뷰

// 메인 웹뷰 컨트롤러 생성
- (void)webViewInitialize {
    if (_webNaviController) {
        [_webNaviController.view removeFromSuperview];
    }
    _webNaviController = nil;
    WebViewController *webController = [[WebViewController alloc] initWithNibName:@"WebViewController" bundle:nil];
    webController.webViewDelegate = self;
//    webController.bPresented = NO;
    //[webController setStartPage:filePath];
    _webNaviController = [[WebNaviViewController alloc] initWithRootViewController:webController];
    [self.view addSubview:_webNaviController.view];
    [self closeWebView];
}

//웹뷰 노출
- (void)showWebView {
    NSLog(@"showWebView");
    [_webNaviController.view setHidden:NO];
}

//웹뷰 숨김
- (void)closeWebView {
    NSLog(@"closeWebView");
    [_webNaviController.view setHidden:YES];
}

@end
