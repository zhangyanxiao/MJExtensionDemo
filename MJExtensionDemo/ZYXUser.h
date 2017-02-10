//
//  ZYXUser.h
//  MJExtensionDemo
//
//  Created by 公安信息 on 17/2/8.
//  Copyright © 2017年 张艳晓. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger, Sex){
    SexMale,
    SexFemale
};
@interface ZYXUser : NSObject
@property (copy, nonatomic) NSString *name;/* 姓名 */
@property (copy, nonatomic) NSString *icon;/* 头像 */
@property (assign, nonatomic) unsigned int age;/* 年龄 */
@property (copy, nonatomic) NSString *height;/* 身高 */
@property (strong, nonatomic) NSNumber *money;/* 资产 */
@property (assign, nonatomic) Sex sex;/* 性别 */
@property (assign, nonatomic, getter=isGay) BOOL gay;/* 是否是同性恋 */

@end
