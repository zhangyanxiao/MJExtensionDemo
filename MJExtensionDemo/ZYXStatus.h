//
//  ZYXStatus.h
//  MJExtensionDemo
//
//  Created by 公安信息 on 17/2/8.
//  Copyright © 2017年 张艳晓. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ZYXUser.h"

@interface ZYXStatus : NSObject

@property (nonatomic, strong) ZYXUser * user;
@property (nonatomic, strong) NSString * text;
//@property (nonatomic, strong) ZYXStatus * retweetedStatus;
@end
