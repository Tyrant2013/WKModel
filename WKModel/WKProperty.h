//
//  WKProperty.h
//  WKModel
//
//  Created by ZHXW on 2018/8/14.
//  Copyright © 2018年 ZHXW. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <objc/runtime.h>
#import "WKMacros.h"

@interface WKProperty : NSObject

@property (nonatomic, copy) NSString                        *name;
@property (nonatomic, copy) NSString                        *clsName;
@property (nonatomic, assign) WKEncodingType                type;

- (instancetype)initWithProperty:(objc_property_t)property;

@end
