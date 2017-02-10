//
//  ViewController.m
//  MJExtensionDemo
//
//  Created by 公安信息 on 17/2/8.
//  Copyright © 2017年 zhangyanxiao. All rights reserved.
//

#import "ViewController.h"
#import "ZYXUser.h"
#import "ZYXStatus.h"
#import "ZYXStatusResult.h"
#import "ZYXAd.h"
#import "ZYXStudent.h"
#import "ZYXBag.h"
#import "ACDModel.h"

#import "MJExtension.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
//    [self DictionaryTransferToMultiModelContainsArrayNameDiffrent];

    [self test];
    
    
    
}
// 1、字典转模型，最简单
-(void)DictionaryTransferToModel{
    NSDictionary *dict = @{
                           @"name" : @"Jack",
                           @"icon" : @"lufy.png",
                           @"age" : @20,
                           @"height" : @"1.55",
                           @"money" : @100.9,
                           @"sex" : @(SexFemale),/* 枚举需要使用NSNumber包装 */
                           @"gay" : @"NO"
                           };

    // 使用的是mj_objectWithKeyValues:方法
    ZYXUser *user = [ZYXUser mj_objectWithKeyValues:dict];
    NSLog(@"name=%@, icon=%@, age=%d, height=%@, money=%@, sex=%ld",
          user.name, user.icon, user.age, user.height, user.money, (long)user.sex);
    // name=Jack, icon=lufy.png, age=20, height=1.550000, money=100.9, sex=1

}
// 2、JSON字符串转模型
-(void)JSONStringTransferToModel{
    // 1.定义一个JSON字符串.
    NSString *jsonString = @"{\"name\":\"Jack\", \"icon\":\"lufy.png\", \"age\":20}";
    
    // 2.JSONString -> User
    ZYXUser *user = [ZYXUser mj_objectWithKeyValues:jsonString];
    
    // 3.打印用户的属性
    NSLog(@"name=%@, icon=%@, age=%d", user.name, user.icon, user.age);
    // name=Jack, icon=lufy.png, age=20
}
 // 3、多层字典嵌套转成嵌套模型
-(void)DictionaryTransferToMultiModel{
    NSDictionary *dict = @{
                           @"text" : @"是啊，今天天气确实不错！",
                           @"user" : @{
                                   @"name" : @"Jack",
                                   @"icon" : @"lufy.png"
                                   },
                           @"retweetedStatus" : @{
                                   @"text" : @"今天天气真不错！",
                                   @"user" : @{
                                           @"name" : @"Rose",
                                           @"icon" : @"nami.png"                    
                                           }                
                                   }            
                           };
    // 将字典转为Status模型
    ZYXStatus *status = [ZYXStatus mj_objectWithKeyValues:dict];
    NSLog(@"text=%@, name=%@, icon=%@", status.text, status.user.name, status.user.icon);
//    text=是啊，今天天气确实不错！, name=Jack, icon=lufy.png

//    NSLog(@"text2=%@, name2=%@, icon2=%@", status.retweetedStatus.text, status.retweetedStatus.user.name, status.retweetedStatus.user.icon);
    // text2=今天天气真不错！, name2=Rose, icon2=nami.png
}
//  4. 复杂的字典 --> 模型 (模型的数组属性里面又装着模型)
-(void)DictionaryTransferToMultiModelContainsArray{
    NSDictionary *dict = @{
                           @"statuses" : @[
                                   @{
                                       @"text" : @"Nice weather!",
                                       @"user" : @{
                                               @"name" : @"Rose",
                                               @"icon" : @"nami.png"
                                               }
                                       },
                                   @{
                                       @"text" : @"Go camping tomorrow!",
                                       @"user" : @{
                                               @"name" : @"Jack",
                                               @"icon" : @"lufy.png"
                                               }
                                       }
                                   ],
                           @"ads" : @[
                                   @{
                                       @"image" : @"ad01.png",
                                       @"url" : @"http://www.ad01.com"
                                       },
                                   @{
                                       @"image" : @"ad02.png",
                                       @"url" : @"http://www.ad02.com"
                                       }
                                   ],
                           @"totalNumber" : @"2014"
                           };
    // 1、将字典转为StatusResult模型
    ZYXStatusResult *result = [ZYXStatusResult mj_objectWithKeyValues:dict];
    // 2.1  第一层ZYXStatusResult
    NSLog(@"totalNumber=%@", result.totalNumber);
    // 2.2  第二层ZYXAd
    for (ZYXAd * ad in result.ads) {
        NSLog(@"image=%@, url=%@", ad.image, ad.url);
        
    }
    for (ZYXStatus *status in result.statuses) {
        NSString *text = status.text;
        NSString *name = status.user.name;
        NSString *icon = status.user.icon;
        NSLog(@"text=%@, name=%@, icon=%@", text, name, icon);
    }

    
}
//  5.Model name - JSON key mapping【模型中的属性名和字典中的key不相同(或者需要多级映射)】
-(void)DictionaryTransferToMultiModelContainsArrayNameDiffrent{
    NSDictionary *dict = @{
                           @"id" : @"20",
                           @"desciption" : @"kids",
                           @"name" : @{
                                   @"newName" : @"lufy",
                                   @"oldName" : @"kitty",
                                   @"info" : @[
                                           @"test-data",
                                           @{
                                               @"nameChangedTime" : @"2013-08"
                                               }
                                           ]
                                   },
                           @"other" : @{
                                   @"bag" : @{
                                           @"name" : @"a red bag",
                                           @"price" : @100.7
                                           }
                                   }
                           };
    // JSON -> Student
    ZYXStudent *stu = [ZYXStudent mj_objectWithKeyValues:dict];
    
    // Printing
//    NSLog(@"ID=%@, desc=%@, oldName=%@, nowName=%@, nameChangedTime=%@",
//          stu.ID, stu.desc, stu.oldName, stu.nowName, stu.nameChangedTime);
    // ID=20, desc=kids, oldName=kitty, nowName=lufy, nameChangedTime=2013-08
//    NSLog(@"bagName=%@, bagPrice=%f", stu.bag.name, stu.bag.price);
    // bagName=a red bag, bagPrice=100.700000
    NSLog(@"%@",stu.info[0]);
    
}
// 6、
-(void)JSONarrayTransferToModelarray{
    NSArray *dictArray = @[
                           @{
                               @"name" : @"Jack",
                               @"icon" : @"lufy.png"
                               },
                           @{
                               @"name" : @"Rose",
                               @"icon" : @"nami.png"
                               }
                           ];
    
    // JSON array -> User array
    NSArray *userArray = [ZYXUser mj_objectArrayWithKeyValuesArray:dictArray];
    
    // Printing
    for (ZYXUser *user in userArray) {
        NSLog(@"name=%@, icon=%@", user.name, user.icon);
    }
    // name=Jack, icon=lufy.png
    // name=Rose, icon=nami.png
    ZYXUser *user = userArray[0];
    NSLog(@"user.name=%@",user.name);
    // user.name=Jack
}
// 7、Model -> JSON【将一个模型转成字典】
-(void)ModelTransferToJSONDictionary{
    ZYXUser *user = [[ZYXUser alloc] init];
    user.name = @"Jack";
    user.icon = @"lufy.png";
    
    ZYXStatus *status = [[ZYXStatus alloc] init];
    status.user = user;
    status.text = @"Nice mood!";
    
    // Status -> JSON
    NSDictionary *statusDict = status.mj_keyValues;
    NSLog(@"%@", statusDict);
    
    /*
     2017-02-09 10:50:03.372 MJExtensionDemo[866:219284] {
        text = "Nice mood!";
        user =     {
             age = 0;
             gay = 0;
             icon = "lufy.png";
             name = Jack;
             sex = 0;
        };
     }

     */
    
    // More complex situation
    ZYXStudent *stu = [[ZYXStudent alloc] init];
    stu.ID = @"123";
    stu.oldName = @"rose";
    stu.nowName = @"jack";
    stu.desc = @"handsome";
    stu.nameChangedTime = @"2018-09-08";
    
    ZYXBag *bag = [[ZYXBag alloc] init];
    bag.name = @"a red bag";
    bag.price = 205;
    stu.bag = bag;
    
    NSDictionary *stuDict = stu.mj_keyValues;
    NSLog(@"%@", stuDict);
    /*
     {
         ID = 123;
         bag =     {
              name = "\U5c0f\U4e66\U5305";
              price = 205;
         };
         desc = handsome;
         nameChangedTime = "2018-09-08";
         nowName = jack;
        oldName = rose;
     }
     */
}
-(void)ModelarrayTransferToJSONarrayDictionary{
    // New model array
    ZYXUser *user1 = [[ZYXUser alloc] init];
    user1.name = @"Jack";
    user1.icon = @"lufy.png";
    
    ZYXUser *user2 = [[ZYXUser alloc] init];
    user2.name = @"Rose";
    user2.icon = @"nami.png";
    
    NSArray *userArray = @[user1, user2];
    
    // Model array -> JSON array
    NSArray *dictArray = [ZYXUser mj_keyValuesArrayWithObjectArray:userArray];
    NSLog(@"%@", dictArray);
    /*
     (
        {
           icon = "lufy.png";
           name = Jack;
         },
        {
           icon = "nami.png";
           name = Rose;
         }
     )
     */
}

- (void)test{
    //    @"D" : @{
    //             @"J" : @{
    //                     @"L" : @"a red bag",
    //                     @"K" : @100.7
    //                     }
    //             }
//    @[
//      @"test-data",
//      @{
//          @"P" : @"2013-08"
//          }
//      ]
    NSDictionary * dict = @{
                            @"A" : @"zyx",
                            
                            @"C" : @{
                                    @"E" : @"lufy",
                                   
                                    @"F" : @[
                                                  @"test-data",
                                                  @{
                                                      @"P" : @"CVDFD",
                                                      @"Q" : @"dfdgj"
                                                      },
                                                  @{
                                                      @"P" : @"vfdgr",
                                                      @"Q" : @"VFGfdfgDFD"
                                                      },
                                                  @{
                                                      @"P" : @"11243CVDFD",
                                                      @"Q" : @"VFGweDFD"
                                                      }
                                             ]
                                    
                                    },
                            };
                            


    ACDModel * model = [ACDModel mj_objectWithKeyValues:dict];
    NSLog(@"%@",model.C.F);
    PModel * model1 = [PModel mj_objectWithKeyValues:model.C.F[1]];
    NSLog(@"%@",model1.P);

    NSMutableArray * array = [NSMutableArray array];
    for (int i = 1; i < model.C.F.count; i++) {
        PModel * model1 = [PModel mj_objectWithKeyValues:model.C.F[i]];
        [array addObject:model1];
    }
    NSLog(@"%@",array);
    



}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
