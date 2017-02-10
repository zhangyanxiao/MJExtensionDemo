//
//  ZYXStatusResult.h
//  MJExtensionDemo
//
//  Created by 公安信息 on 17/2/8.
//  Copyright © 2017年 张艳晓. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ZYXAd.h"
#import "ZYXStatus.h"
@interface ZYXStatusResult : NSObject
/** Contatins status model */
@property (strong, nonatomic) NSMutableArray<ZYXStatus *> *statuses;
/** Contatins ad model */
@property (strong, nonatomic) NSArray<ZYXAd *> *ads;
@property (strong, nonatomic) NSNumber *totalNumber;
@end
