//
//  ViewController.m
//  WKModel
//
//  Created by ZHXW on 2018/8/14.
//  Copyright © 2018年 ZHXW. All rights reserved.
//

#import "ViewController.h"
#import "Data.h"
#import "User.h"
#import "NSObject+WKModel.h"
#import "WKStaticMethods.h"
#import <objc/runtime.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    unsigned int count;
    objc_property_t *properties = class_copyPropertyList([Data class], &count);
    for (int i = 0; i < count; ++i) {
        const char *name = property_getName(properties[i]);
        unsigned int inCount;
        NSLog(@"name: %@", [NSString stringWithUTF8String:name]);
        objc_property_attribute_t *attrs = property_copyAttributeList(properties[i], &inCount);
        for (int j = 0; j < inCount; ++j) {
            NSLog(@"%@, %@", [NSString stringWithUTF8String:attrs[j].name], [NSString stringWithUTF8String:attrs[j].value]);
        }
        NSLog(@"end =================");
    }
    
    const char *tt = @encode(NSString *);
    NSLog(@"%@", [NSString stringWithUTF8String:tt]);
    
//    Data *data = [Data wk_modelWithDictionary:@{
//                                                @"user" : @{
//                                                            @"name" : @"my name",
//                                                            @"age" : @12
//                                                            },
//                                                @"names" : @[@{
//                                                                 @"name" : @"arr one",
//                                                                 @"age" : @14
//                                                            },
//                                                             @{
//                                                                 @"name" : @"arr two",
//                                                                 @"age" : @15
//                                                                 }
//                                                             ]
//                                                }];
//    NSLog(@"%@, %ld, %ld", data.user.name, data.user.age, data.names.count);
//
//    for (User *item in data.names) {
//        NSLog(@"%@, %ld", item.name, item.age);
//    }
    
    
//    User *user = [User wk_modelWithDictionary:@{
//                                                @"name" : @"my name",
//                                                @"age" : @12
//                                                }];
//    NSLog(@"%@, %ld", user.name, user.age);
    
}


@end
