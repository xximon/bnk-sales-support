//
//  ViewController.m
//  bnk-sales-support
//
//  Created by YOUNGRAE SEO on 2020/10/29.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self getInitData];
}

-(void)initView{
    
}

-(void)initListener{
    
}

-(void)getInitData {
    
    NSDictionary *param = @{
        @"cmgrpCd" : @"09",
        @"userId"  : @"9999999",
        @"password": @"aa12345^"
    };
    [[NetworkManager sharedInstance]post:[NSString stringWithFormat:@"%@%@%@", SERVER_URL,API,INIT_DATA]                                 parameters:param
                                headers:nil
                                complete:^(id  _Nullable responseObj, NSURLResponse * _Nonnull response) {
        NSLog(@"=== [SUCCESS]response:: %@",responseObj);
    }
                                    fail:^(NSError * _Nullable error) {
        NSLog(@"=== [ERROR]response:: %@",error.localizedDescription);
        
    }];
}


@end
