//
//  User.h
//  WKModel
//
//  Created by ZHXW on 2018/8/14.
//  Copyright © 2018年 ZHXW. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface User : NSObject

@property (nonatomic, copy) NSString                    *name;
@property (nonatomic, assign) NSUInteger                age;
@property (nonatomic, copy) void(^copyBlock)(void);

@end
