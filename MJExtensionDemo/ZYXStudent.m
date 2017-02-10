//
//  ZYXStudent.m
//  MJExtensionDemo
//
//  Created by 公安信息 on 17/2/9.
//  Copyright © 2017年 张艳晓. All rights reserved.
//

#import "ZYXStudent.h"
#import "MJExtension.h"
@implementation ZYXStudent
- (instancetype)init
{
    self = [super init];
    if (self) {
        [ZYXStudent mj_setupReplacedKeyFromPropertyName:^NSDictionary *{
            return @{
                     @"ID" : @"id",
                     @"desc" : @"desciption",
                     @"oldName" : @"name.oldName",
                     @"nowName" : @"name.newName",
                     @"info":@"name.info",
                     @"nameChangedTime" : @"name.info[1].nameChangedTime",
                     @"bag" : @"other.bag"
                     };
        }];
    }
    return self;
}
@end
