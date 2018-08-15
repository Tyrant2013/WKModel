//
//  WKProperty.m
//  WKModel
//
//  Created by ZHXW on 2018/8/14.
//  Copyright © 2018年 ZHXW. All rights reserved.
//

#import "WKProperty.h"
#import "WKStaticMethods.h"

@implementation WKProperty

- (instancetype)initWithProperty:(objc_property_t)property {
    if (self = [super init]) {
        _name = [NSString stringWithUTF8String:property_getName(property)];
        
        unsigned int count;
        objc_property_attribute_t *attrs = property_copyAttributeList(property, &count);
        for (int i = 0; i < count; ++i) {
            objc_property_attribute_t attr = attrs[i];
            if (*attr.name == 'T') {
                _type = [WKStaticMethods getEncodingType:attr.value];
                _clsName = [WKStaticMethods getClassName:attr.value];
                break;
            }
        }
    }
    return self;
}

@end
