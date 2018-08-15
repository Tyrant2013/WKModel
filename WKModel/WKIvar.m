//
//  WKIvar.m
//  WKModel
//
//  Created by ZHXW on 2018/8/14.
//  Copyright © 2018年 ZHXW. All rights reserved.
//

#import "WKIvar.h"
#import "WKStaticMethods.h"

@implementation WKIvar

- (instancetype)initWithIvar:(Ivar)ivar {
    if (self = [super init]) {
        _name = [NSString stringWithUTF8String:ivar_getName(ivar)];
        _propertyName = [_name substringFromIndex:1];
        _type = [WKStaticMethods getEncodingType:ivar_getTypeEncoding(ivar)];
    }
    return self;
}

@end
