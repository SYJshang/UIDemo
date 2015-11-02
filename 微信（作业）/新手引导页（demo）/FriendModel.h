//
//  FriendModel.h
//  新手引导页（demo）
//
//  Created by 请叫我学霸 on 15/10/31.
//  Copyright (c) 2015年 qingyun.com. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FriendModel : NSObject

@property (nonatomic,strong)NSString *icon;
@property (nonatomic,strong)NSString *name;
@property (nonatomic,strong)NSString *status;
@property (nonatomic)BOOL vip;

- (instancetype)initWithDictionary:(NSDictionary *)dict;
+ (instancetype)friendWithDictionary:(NSDictionary *)dict;

@end
