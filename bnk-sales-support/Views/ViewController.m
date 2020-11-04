//
//  ViewController.m
//  bnk-sales-support
//
//  Created by YOUNGRAE SEO on 2020/10/29.
//

#import "ViewController.h"

#import "AdminMenuItem.h"
#import "ProjectManagementItem.h"

@interface ViewController (){
    NSMutableArray *arrAdminMenuItem;
    NSDictionary *dictProjectManagementItem;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self initView];
    [self initListener];
    [self getInitData];
}

-(void)initView{
    [self menuViewInitilize];
}

-(void)initListener{
    [self addObservers];
}

-(void)addObservers{
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(showMenu) name:@"SHOW_MENU" object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(closeMenu) name:@"CLOSE_MENU" object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(closeMenuNoAnimation) name:@"CLOSE_MENU_NO_ANIMATION" object:nil];
}

// 초기데이터 요청 및 수신
-(void)getInitData {
    
    NSDictionary *param = @{
        @"cmgrpCd" : @"09",
        @"userId"  : @"9999999",
        @"password": @"aa12345^"
    };
    
//    [[NetworkManager sharedInstance]post:[NSString stringWithFormat:@"%@%@%@", SERVER_URL,API,INIT_DATA]                                 parameters:param
//                                headers:nil
//                                complete:^(id  _Nullable responseObj, NSURLResponse * _Nonnull response) {
//
//
//        NSLog(@"=== [SUCCESS]response:: %@",responseObj);
//
//
//    }
//                                    fail:^(NSError * _Nullable error) {
//        NSLog(@"=== [ERROR]response:: %@",error.localizedDescription);
//
//        [self getLocalJsonData];
//
//    }];
    [self getLocalJsonData];
}

// 로컬 JSON 초기데이터 파싱
-(void)getLocalJsonData{
    NSLog(@"=== [LOCAL] JSON 초기 데이터 로딩");
    NSLog(@"===");
    NSLog(@"===");

    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"InitData" ofType:@"json"];
    NSString *myJSON = [[NSString alloc] initWithContentsOfFile:filePath encoding:NSUTF8StringEncoding error:NULL];
    
    NSError *err =  nil;
    
    NSDictionary *dictInitData = [[NSDictionary alloc]init];
    dictInitData = [NSJSONSerialization JSONObjectWithData:[myJSON dataUsingEncoding:NSUTF8StringEncoding] options:nil error:&err];
    
    [[NSUserDefaults standardUserDefaults]setObject:myJSON forKey:INITDATA_KEY];
    
    NSArray *jsonDataArray = [[NSArray alloc]init];
    jsonDataArray = dictInitData[@"menus"][0][@"children"];
    
    NSDictionary *dictItem = [[NSDictionary alloc]init];
    arrAdminMenuItem = [[NSMutableArray alloc]init];
    dictProjectManagementItem = [[NSDictionary alloc]init];
    dictProjectManagementItem = dictInitData[@"menus"][1];

    for(int i=0; i<[jsonDataArray count];i++){
        AdminMenuItem *adminMenuItem = [AdminMenuItem alloc];
        
        dictItem = [jsonDataArray objectAtIndex:i];
        [adminMenuItem initWithJSON:dictItem];
        [arrAdminMenuItem addObject:adminMenuItem];
    }
    ProjectManagementItem *projectManagementItem = [[ProjectManagementItem alloc]initWithJSON:dictProjectManagementItem];
    NSLog(@"=== 초기데이터 관리자메뉴 수신 ===");
    NSLog(@"=== AdminMenuItems: %@",arrAdminMenuItem);
    NSLog(@"=== ProjectManagementItems: %@",projectManagementItem);
}


#pragma mark - IBActions

- (IBAction)onClickBtn:(id)sender {
    if([sender tag] == 1){
        // 웹뷰전환
        NSLog(@" === 웹뷰전환 버튼 클릭");
    }else if([sender tag] == 2){
        // 메뉴표시
//        SHOW_MENU;
        NSLog(@" === 메뉴표시 버튼 클릭");
        [self showMenu];
        
    }
}

#pragma mark - 사이드 메뉴
//메뉴 뷰컨트롤러 생성
- (void) menuViewInitilize {
    if (_sideMenuViewController) {
        [_sideMenuViewController.view removeFromSuperview];
    }
    _sideMenuViewController = nil;
    _sideMenuViewController = [[SideMenuViewController alloc] initWithNibName:@"SideMenuViewController" bundle:nil];;
    [_sideMenuViewController.view setHidden:YES];
    _sideMenuViewController.view.frame = CGRectMake(SCREEN_WIDTH, 0, SCREEN_WIDTH, SCREEN_HEIGHT);
    [self.view addSubview:_sideMenuViewController.view];
    
//    [[NSNotificationCenter defaultCenter] postNotificationName:@"CREATE_MENU_DATE" object:nil];
}

// 메뉴 뷰 열기
-(void)showMenu{
    [self closeMenuNoAnimation];
    
    [self menuAnimation:YES];
}

//메뉴 뷰 닫기
- (void)closeMenu {
    [_sideMenuViewController.bgView setAlpha:0];
    
    CGRect frame = _sideMenuViewController.view.frame;
    frame.origin.x = SCREEN_WIDTH;
    
    [UIView animateWithDuration:SLIDE_MENU_DURATION_TIME delay:0 options:UIViewAnimationOptionCurveEaseOut animations:^{
        self->_sideMenuViewController.view.frame = frame;
    } completion:^(BOOL finished) {
        [self->_sideMenuViewController.view setHidden:YES];
    }];
}

//메뉴 뷰 닫기 (애니메이션 없음)
- (void)closeMenuNoAnimation {
    [_sideMenuViewController.bgView setAlpha:0];
    
    CGRect frame = _sideMenuViewController.view.frame;
    frame.origin.x = SCREEN_WIDTH;
    
    _sideMenuViewController.view.frame = frame;
}

- (void)menuAnimation:(BOOL)animation {
    //메뉴가 닫힌 상태, 열어줌.
    if (_sideMenuViewController.view.frame.origin.x > 0) {
        
        CGRect frame = _sideMenuViewController.view.frame;
        frame.origin.x = 0.0f;
        
        [_sideMenuViewController.view setHidden:NO];
        
        if (animation) {
            [UIView animateWithDuration:SLIDE_MENU_DURATION_TIME delay:0 options:UIViewAnimationOptionCurveEaseOut animations:^{
                self->_sideMenuViewController.view.frame = frame;
            } completion:^(BOOL finished) {
                [self->_sideMenuViewController.bgView setAlpha:0.4];
            }];
        }else {
            _sideMenuViewController.view.frame = frame;
        }
    }else {
        
        CGRect frame = _sideMenuViewController.view.frame;
        frame.origin.x = SCREEN_WIDTH;
        
        if (animation) {
            [UIView animateWithDuration:SLIDE_MENU_DURATION_TIME delay:0 options:UIViewAnimationOptionCurveEaseOut animations:^{
                self->_sideMenuViewController.view.frame = frame;
            } completion:^(BOOL finished) {
                [self->_sideMenuViewController.view setHidden:YES];
            }];
        }else {
            _sideMenuViewController.view.frame = frame;
        }
    }
    
    [self.view layoutIfNeeded];
}

@end
