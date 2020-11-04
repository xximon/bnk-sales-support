//
//  SideMenuViewController.h
//  bnk-sales-support
//
//  Created by YOUNGRAE SEO on 2020/11/03.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface SideMenuViewController : UIViewController<UITableViewDataSource, UITableViewDelegate>

//MARK: properties
@property (weak, nonatomic) IBOutlet UIButton *btnAdmin;
@property (weak, nonatomic) IBOutlet UIButton *btnProjectManagement;
@property (weak, nonatomic) IBOutlet UITableView *tvMenu;
@property (weak, nonatomic) IBOutlet UIView *bgView;

@end

NS_ASSUME_NONNULL_END
