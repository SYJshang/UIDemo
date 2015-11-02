//
//  FriendModel.m
//  新手引导页（demo）
//
//  Created by 请叫我学霸 on 15/10/31.
//  Copyright (c) 2015年 qingyun.com. All rights reserved.
//

#import "FriendModel.h"

@implementation FriendModel

- (instancetype)initWithDictionary:(NSDictionary *)dict
{
    if (self = [super init]) {
        [self setValuesForKeysWithDictionary:dict];
    }
    return self;
}
+ (instancetype)friendWithDictionary:(NSDictionary *)dict
{
    return [[self alloc]initWithDictionary:dict];
}

@end
