//
//  ZYXStudent.h
//  MJExtensionDemo
//
//  Created by 公安信息 on 17/2/9.
//  Copyright © 2017年 张艳晓. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ZYXBag.h"
@interface ZYXStudent : NSObject
@property (copy, nonatomic) NSString *ID;
@property (copy, nonatomic) NSString *desc;
@property (copy, nonatomic) NSString *nowName;
@property (copy, nonatomic) NSString *oldName;
@property (copy, nonatomic) NSString *nameChangedTime;
@property (copy, nonatomic) NSArray *info;
@property (strong, nonatomic) ZYXBag *bag;
@end
