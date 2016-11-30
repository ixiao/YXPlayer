//
//  live.h
//  XXPlayer
//
//  Created by IOS Developer on 16/10/27.
//  Copyright © 2016年 Shaun. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "creator.h"
@interface Live : NSObject

@property (nonatomic, copy)  NSString * ID;
@property (nonatomic, strong) Creator * creator;
@property (nonatomic, copy) NSString * name;
@property (nonatomic, copy) NSString * city;
@property (nonatomic, copy) NSString * share_addr;
@property (nonatomic, copy) NSString * stream_addr;
@property (nonatomic, assign) NSUInteger version;
@property (nonatomic, assign) NSUInteger slot;
@property (nonatomic, assign) NSUInteger optimal;
@property (nonatomic, assign) NSUInteger online_users;
@property (nonatomic, assign) NSUInteger group;
@property (nonatomic, assign) NSUInteger link;
@property (nonatomic, assign) NSUInteger multi;
@end
