//
//  SideMenuContentCell.h
//  bnk-sales-support
//
//  Created by YOUNGRAE SEO on 2020/11/04.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface SideMenuContentCell : UITableViewCell

//MARK: properties
@property (strong, nonatomic) IBOutlet UILabel *lblTitle;
@property (strong, nonatomic) IBOutlet UIImageView *ivArrowRight;

@end

NS_ASSUME_NONNULL_END
