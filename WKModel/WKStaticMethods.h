//
//  WKStaticMethods.h
//  WKModel
//
//  Created by ZHXW on 2018/8/14.
//  Copyright © 2018年 ZHXW. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WKMacros.h"

@interface WKStaticMethods : NSObject

+ (WKEncodingType)getEncodingType:(const char *)encodingType;
+ (NSString *)getClassName:(const char *)encodingType;
+ (id)getValueForClass:(Class)cls dict:(NSDictionary *)dict;

@end
