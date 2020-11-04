//
//  SideMenuViewController.m
//  bnk-sales-support
//
//  Created by YOUNGRAE SEO on 2020/11/03.
//

#import "SideMenuViewController.h"

@interface SideMenuViewController ()

@end

@implementation SideMenuViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    [self initView];
    [self initListener];
}

-(void)initView{
    
}
-(void)initListener{
    
}

#pragma mark - IBAction
- (IBAction)onClickBtn:(id)sender {
    if([sender tag] == 1){
        NSLog(@"=== 관리자메뉴 클릭");
    }else if([sender tag] == 2){
        NSLog(@"=== 프로젝트관리 클릭");
    }
}

//스와이프, 탭 제스쳐
- (IBAction)swipeTapGestureAction:(id)sender {
    CLOSE_MENU;
}


#pragma mark - TableView

//MARK: DataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
    //return arrOnlineClass.count
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    return nil;
}

//MARK: Delegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
}

@end
