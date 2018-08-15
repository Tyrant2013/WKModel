//
//  WKIvar.h
//  WKModel
//
//  Created by ZHXW on 2018/8/14.
//  Copyright © 2018年 ZHXW. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <objc/runtime.h>
#import "WKMacros.h"

@interface WKIvar : NSObject

@property (nonatomic, copy) NSString                            *propertyName;
@property (nonatomic, copy) NSString                            *name;
@property (nonatomic, assign) WKEncodingType                    type;

- (instancetype)initWithIvar:(Ivar)ivar;

@end
