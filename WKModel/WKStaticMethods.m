//
//  WKStaticMethods.m
//  WKModel
//
//  Created by ZHXW on 2018/8/14.
//  Copyright © 2018年 ZHXW. All rights reserved.
//

#import "WKStaticMethods.h"
#import <objc/runtime.h>
#import "WKProperty.h"
#import "NSObject+WKModel.h"

@implementation WKStaticMethods

+ (WKEncodingType)getEncodingType:(const char *)encodingType {
    char *type = (char *)encodingType;
    size_t len = strlen(type);
    WKEncodingType ivarType = WKEncodingTypeUnknown;
    BOOL prefrex = YES;
    while (prefrex) {
        switch (*type) {
            case 'r':// const
                ivarType |= WKEncodingTypeQualifierConst;
                type++;
                break;
            case 'n':// in
                ivarType |= WKEncodingTypeQualifierIn;
                type++;
                break;
            case 'N':// inout
                ivarType |= WKEncodingTypeQualifierInout;
                type++;
                break;
            case 'o':// out
                ivarType |= WKEncodingTypeQualifierOut;
                type++;
                break;
            case 'O':// bycopy
                ivarType |= WKEncodingTypeQualifierBycopy;
                type++;
                break;
            case 'R':// byref
                ivarType |= WKEncodingTypeQualifierByref;
                type++;
                break;
            case 'V':// oneway
                ivarType |= WKEncodingTypeQualifierOneway;
                type++;
                break;
            default:
                prefrex = NO;
                break;
        }
    }
    len = strlen(type);
    if (len == 0) return ivarType;
    switch (*type) {
        case 'c':
            ivarType |= WKEncodingTypeChar;
            break;
        case 'i':
            ivarType |= WKEncodingTypeInt;
            break;
        case 's':
            ivarType |= WKEncodingTypeShort;
            break;
        case 'l':
            ivarType |= WKEncodingTypeLong;
            break;
        case 'q':
            ivarType |= WKEncodingTypeLongLong;
            break;
        case 'C':
            ivarType |= WKEncodingTypeUnsignedChar;
            break;
        case 'I':
            ivarType |= WKEncodingTypeUnsignedInt;
            break;
        case 'S':
            ivarType |= WKEncodingTypeUnsignedShort;
            break;
        case 'L':
            ivarType |= WKEncodingTypeUnsignedLong;
            break;
        case 'Q':
            ivarType |= WKEncodingTypeUnsignedLongLong;
            break;
        case 'f':
            ivarType |= WKEncodingTypeFloat;
            break;
        case 'd':
            ivarType |= WKEncodingTypeDouble;
            break;
        case 'B':
            ivarType |= WKEncodingTypeBool;
            break;
        case 'v':
            ivarType |= WKEncodingTypeVoid;
            break;
        case '*':
            ivarType |= WKEncodingTypeString;
            break;
        case '@':
        {
            if (len == 2 && *(type + 1) == '?') {
                ivarType |= WKEncodingTypeBlock;
            }
            else {
                ivarType |= WKEncodingTypeObject;
            }
        }
            break;
        case '#':
            ivarType |= WKEncodingTypeClass;
            break;
        case ':':
            ivarType |= WKEncodingTypeSelector;
            break;
        case '[':
            ivarType |= WKEncodingTypeArray;
            break;
        case '{':
            ivarType |= WKEncodingTypeStructure;
            break;
        case '(':
            ivarType |= WKEncodingTypeUnion;
            break;
        case 'b':
            ivarType |= WKEncodingTypeNumBits;
            break;
        case '^':
            ivarType |= WKEncodingTypePoint;
            break;
        default:
            break;
    }
    return ivarType;
}

+ (NSString *)getClassName:(const char *)encodingType {
    char *type = (char *)encodingType;
    size_t len = strlen(type);
    if (len <= 3) return nil;
    type += 2;
    NSString *str = [NSString stringWithUTF8String:type];
    str = [str substringToIndex:str.length - 1];
    return str;
}

+ (id)getValueForClass:(Class)cls dict:(NSDictionary *)dict {
    id obj = [cls new];
    unsigned int count;
    objc_property_t *properties = class_copyPropertyList(cls, &count);
    for (int i = 0; i < count; ++i) {
        WKProperty *property = [[WKProperty alloc] initWithProperty:properties[i]];
        id val = dict[property.name];
        if (!val) {
            continue;
        }
        if ([val isKindOfClass:[NSDictionary class]]) {
            [obj setValue:[self getValueForClass:NSClassFromString(property.clsName) dict:val] forKey:property.name];
        }
        else if ([val isKindOfClass:[NSArray class]]) {
            Class arrCls;
            if ([cls respondsToSelector:@selector(modelArrayMapper)]) {
                NSDictionary *mapDict = [cls modelArrayMapper];
                arrCls = mapDict[property.name];
            }
            NSMutableArray *array = [NSMutableArray array];
            for (id item in (NSArray *)val) {
                if (arrCls && [item isKindOfClass:[NSDictionary class]]) {
                    [array addObject:[self getValueForClass:arrCls dict:item]];
                }
                else if (arrCls && [item isKindOfClass:[NSArray class]]) {
                    [array addObject:[self getValueForClass:arrCls dict:item]];
                }
                else {
                    [array addObject:item];
                }
            }
            if (array.count > 0) {
                [obj setValue:[array copy] forKey:property.name];
            }
        }
        else {
            [obj setValue:val forKey:property.name];
        }
    }
    return obj;
}

@end
