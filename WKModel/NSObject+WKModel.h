//
//  NSObject+WKModel.h
//  WKModel
//
//  Created by ZHXW on 2018/8/14.
//  Copyright © 2018年 ZHXW. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (WKModel)

+ (instancetype)wk_modelWithDictionary:(NSDictionary *)dict;

+ (NSDictionary *)modelArrayMapper;

@end
