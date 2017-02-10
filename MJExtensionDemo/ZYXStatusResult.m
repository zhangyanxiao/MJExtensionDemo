//
//  ZYXStatusResult.m
//  MJExtensionDemo
//
//  Created by 公安信息 on 17/2/8.
//  Copyright © 2017年 张艳晓. All rights reserved.
//

#import "ZYXStatusResult.h"
#import "MJExtension.h"
@implementation ZYXStatusResult
- (instancetype)init
{
    self = [super init];
    if (self) {
        // ZYXStatusResult类中的两个数组中存放的是哪两个模型
        [ZYXStatusResult mj_setupObjectClassInArray:^NSDictionary *{
            return @{
                     @"statuses" : @"ZYXStatus",
                     // @"statuses" : [Status class],
                     @"ads" : @"ZYXAd"
                     // @"ads" : [Ad class]
                     };
        }];
    }
    return self;
}
//等价于: StatusResult.m 实现 +objectClassInArray 方法.
@end
