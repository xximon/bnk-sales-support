//
//  ProjectManagementItem.h
//  bnk-sales-support
//
//  Created by YOUNGRAE SEO on 2020/11/04.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface ProjectManagementItem : NSObject

-(instancetype)initWithJSON:(NSDictionary *)jsonDictionary;


@property(assign, nonatomic) int _id;
@property(assign, nonatomic) int depth;
@property(assign, nonatomic) int parentId;
@property(strong, nonatomic) NSString *name;
@property(strong, nonatomic) NSString *path;
@property(strong, nonatomic) NSString *title;
@property(strong, nonatomic) NSString *expand;
@property(strong, nonatomic) NSString *icon;


@end

NS_ASSUME_NONNULL_END
