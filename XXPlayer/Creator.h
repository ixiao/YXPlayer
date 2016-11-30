//
//  creator.h
//  XXPlayer
//
//  Created by IOS Developer on 16/10/27.
//  Copyright © 2016年 Shaun. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Creator : NSObject
@property (nonatomic, assign) NSUInteger ID;
@property (nonatomic, assign) NSUInteger level;
@property (nonatomic, assign) NSUInteger gender;
@property (nonatomic, copy) NSString * nick;
@property (nonatomic, copy) NSString * portrait;

@end
