//
//  LiveTableViewCell.h
//  XXPlayer
//
//  Created by IOS Developer on 16/10/27.
//  Copyright © 2016年 Shaun. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <IJKMediaFramework/IJKMediaFramework.h>
#import "live.h"

@interface LiveTableViewCell : UITableViewCell
@property (nonatomic, strong) id <IJKMediaPlayback>player;
@property (nonatomic, strong) Live * model;

@end



#define K_SCREENSIZE [[UIScreen mainScreen] bounds]
#define K_SCREENWIDTH [[UIScreen mainScreen] bounds].size.width
#define K_SCREENHEIGHT [[UIScreen mainScreen] bounds].size.height

/**
 *  关于颜色的宏定义
 */

#define K_COLOR(r,g,b)  [UIColor colorWithRed:(r/255.0) green:(g/255.0) blue:(b/255.0) alpha:1]

#define K_COLOR_BACKGROUND  K_COLOR(239,239,244)
#define K_COLOR_TEXT_TITLE  K_COLOR(99,99,99)
#define K_COLOR_TEXT_BODY   K_COLOR(155,155,155)
