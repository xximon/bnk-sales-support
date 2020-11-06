//
//  SideMenuViewController.m
//  bnk-sales-support
//
//  Created by YOUNGRAE SEO on 2020/11/03.
//

#import "SideMenuViewController.h"

#import "SideMenuContentCell.h"

@interface SideMenuViewController (){
    int menuBtnDvcd; // 1: 관리자메뉴 , 2: 프로젝트관리
    
    NSMutableArray *arrMenuItems;
    NSDictionary *dictProjMng;
}

@end

@implementation SideMenuViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    [self initView];
    [self initListener];
}

-(void)initView {
    
    [self.tvMenu registerNib:[UINib nibWithNibName:@"SideMenuContentCell" bundle:nil] forCellReuseIdentifier:@"side_menu_content_cell"];
    
    self.tvMenu.dataSource = self;
    self.tvMenu.delegate = self;
    
    menuBtnDvcd = 1;
    [self setItems:menuBtnDvcd];
}

-(void)initListener {
    
}

-(void)setItems:(NSInteger)tag {
    NSDictionary *data = [[NSDictionary alloc]init];
    NSString *strJSON = [[NSUserDefaults standardUserDefaults]objectForKey:INITDATA_KEY];
    
    NSError *err =  nil;
    
    data = [NSJSONSerialization JSONObjectWithData:[strJSON dataUsingEncoding:NSUTF8StringEncoding] options:nil error:&err];
    
    if(tag == 1){
        arrMenuItems = data[@"menus"][0][@"children"];
    }else{
        arrMenuItems = data[@"menus"][1][@"children"];
    }
}

#pragma mark - IBAction
- (IBAction)onClickBtn:(id)sender {
    if([sender tag] == 1){
        NSLog(@"=== 관리자메뉴 클릭");
        menuBtnDvcd = 1;
    }else if([sender tag] == 2){
        NSLog(@"=== 프로젝트관리 클릭");
        menuBtnDvcd = 2;
    }
    [self setItems:[sender tag]];
    [self.tvMenu reloadData];
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
//    if(menuBtnDvcd == 1){
//        if(arrMenuItems.count<1){
//            return 1;
//        }else{
//            return arrMenuItems.count;
//        }
//    }else{
//        return 1;
////        return dictProjMng.count;
//    }
    if(arrMenuItems.count > 0){
        return arrMenuItems.count;
    }else{
        return 1;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    SideMenuContentCell *cell = [tableView dequeueReusableCellWithIdentifier:@"side_menu_content_cell" forIndexPath:indexPath];
    
    if (arrMenuItems != nil && arrMenuItems.count > 0) {
        NSDictionary *dict = arrMenuItems[indexPath.row];
        cell.lblTitle.text=dict[@"title"];
    }
    
//    if(menuBtnDvcd == 1){
//        if (arrMenuItems != nil && arrMenuItems.count > 0) {
//            NSDictionary *dict = arrMenuItems[indexPath.row];
//            cell.lblTitle.text = dict[@"title"];
//        }else{
//            cell.lblTitle.text = nil;
//        }
//    }else if(menuBtnDvcd == 2){
//        NSDictionary *dict = rrMenuItems[indexPath.row;
//        cell.lblTitle.text=dict[@"title"];
//    }

    return cell;
}

//MARK: Delegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if(menuBtnDvcd == 1){
        
    }else if(menuBtnDvcd == 2){
        // TODO: 프로젝트관리 [ pageChange("/pms/Project") ] 구현
        ON_CLICK_PROJ_MGNT
//        SHOW_WEBVIEW;
    }
}

@end
