//
//  Data.h
//  WKModel
//
//  Created by ZHXW on 2018/8/14.
//  Copyright © 2018年 ZHXW. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "User.h"

@interface Data : NSObject

@property (nonatomic, strong) User                                          *user;
@property (nonatomic, strong) NSArray<NSString *>                           *names;

@property (nonatomic, assign) NSMutableArray                                *strs;
@property (nonatomic, copy) NSString                                        *title;
@property (nonatomic, assign) NSInteger                                     length;
@property (nonatomic, copy) void(^BlockName)(void); 

@end
