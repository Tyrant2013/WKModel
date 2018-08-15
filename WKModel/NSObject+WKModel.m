//
//  NSObject+WKModel.m
//  WKModel
//
//  Created by ZHXW on 2018/8/14.
//  Copyright © 2018年 ZHXW. All rights reserved.
//

#import "NSObject+WKModel.h"
#import <objc/runtime.h>

#import "WKIvar.h"
#import "WKProperty.h"

#import "WKStaticMethods.h"

@implementation NSObject (WKModel)

+ (instancetype)wk_modelWithDictionary:(NSDictionary *)dict {
    return [WKStaticMethods getValueForClass:[self class] dict:dict];
}

+ (NSDictionary *)modelArrayMapper {
    return @{};
}

@end
