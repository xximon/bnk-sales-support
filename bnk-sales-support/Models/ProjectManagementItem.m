//
//  ProjectManagementItem.m
//  bnk-sales-support
//
//  Created by YOUNGRAE SEO on 2020/11/04.
//

#import "ProjectManagementItem.h"

@implementation ProjectManagementItem

- (instancetype)initWithJSON:(NSDictionary *)jsonDictionary{
    
    self._id = jsonDictionary[@"id"];
    self.depth = jsonDictionary[@"depth"];
    self.parentId = jsonDictionary[@"parentId"];
    self.name = jsonDictionary[@"name"];
    self.path = jsonDictionary[@"path"];
    self.title = jsonDictionary[@"title"];
    self.expand = jsonDictionary[@"expand"];
    self.icon = jsonDictionary[@"icon"];
    
    return self;
}

@end
