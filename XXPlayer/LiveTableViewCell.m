//
//  LiveTableViewCell.m
//  XXPlayer
//
//  Created by IOS Developer on 16/10/27.
//  Copyright © 2016年 Shaun. All rights reserved.
//

#import "LiveTableViewCell.h"



#import "UIImageView+WebCache.h"
@interface LiveTableViewCell ()

@property (nonatomic, strong) UIView * playerView;
@property (nonatomic, strong) UIImageView * imageHolder;
@property (nonatomic, strong) UIImageView * icon;
@property (nonatomic, strong) UILabel * name;
@property (nonatomic, strong) UILabel * city;
@property (nonatomic, strong) UILabel * online;
@property (nonatomic, strong) UIButton * pauesBtn;

@end

static CGFloat CreatorBarHeight = 44;
static CGFloat MarginSize       = 3;
static CGFloat NameHeight       = 20;


@implementation LiveTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self initUI];
    }
    return self;
}


- (void)setModel:(Live *)model
{
    NSURL *imageUrl = [NSURL URLWithString:[NSString stringWithFormat:@"http://img.meelive.cn/%@",model.creator.portrait]];
    [self.imageHolder sd_setImageWithURL:imageUrl placeholderImage:[UIImage imageNamed:@"Loading"]];
    
    [self.icon sd_setImageWithURL:imageUrl];

    self.player = [[IJKFFMoviePlayerController alloc]initWithContentURL:[NSURL URLWithString:model.stream_addr] withOptions:nil];
    [self.player prepareToPlay];
    [self.player setScalingMode:IJKMPMovieScalingModeAspectFill];
    self.playerView = [self.player view];
    self.playerView.frame = CGRectMake(0, CreatorBarHeight, K_SCREENWIDTH, K_SCREENWIDTH);
    
    UITapGestureRecognizer * tapPause = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(pauseBtnAction:)];
    tapPause.numberOfTapsRequired = 1; //点击次数
    tapPause.numberOfTouchesRequired = 1; //点击手指数
    [self.playerView addGestureRecognizer:tapPause];
    
    self.name.text = model.creator.nick;
    if (model.city.length == 0) {
        self.city.text = @"难道在火星?";
    }else{
        self.city.text = model.city;
    }
}
- (void)initUI
{
    self.contentView.backgroundColor = K_COLOR_BACKGROUND;
    
//    UIView * displayView = [[UIView alloc]initWithFrame:CGRectMake(0, 50, self.view.bounds.size.width, 180)];
//    self.playerView = displayView;

//    playerView.frame = self.playerView.bounds;
    
//    [self.playerView insertSubview:playerView atIndex:1];
    
//    [self installMovieNotificationObservers];
}

- (void)pauseBtnAction:(UIGestureRecognizer *)sender
{
    if ([self.player isPlaying]) {
        [self.player pause];
    }else
    {
        [self.player play];
    }
}

-(UIButton *)pauesBtn
{
    if (!_pauesBtn) {
        _pauesBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _pauesBtn.backgroundColor = [UIColor clearColor];
        [_pauesBtn setImage:[UIImage imageNamed:@"20071127225100476"] forState:UIControlStateNormal];
        _pauesBtn.frame = CGRectMake(0, CreatorBarHeight, K_SCREENWIDTH, K_SCREENWIDTH);
    }
    return _pauesBtn;
}
- (UIView *)playerView
{
    if (!_playerView) {
        _playerView = [[UIView alloc]initWithFrame:CGRectMake(0, CreatorBarHeight, K_SCREENWIDTH, K_SCREENWIDTH)];
        self.playerView.userInteractionEnabled = YES;
        _playerView.backgroundColor = [UIColor blackColor];
    }
   
    [self.contentView addSubview:_playerView];
    return _playerView;
}
- (UIImageView *)imageHolder
{
    if (!_imageHolder) {
        _imageHolder = [[UIImageView alloc]initWithFrame:CGRectMake(0, CreatorBarHeight, K_SCREENWIDTH, K_SCREENWIDTH)];
    }
    [self.contentView addSubview:_imageHolder];
    return _imageHolder;
}

-(UIImageView *)icon
{
    if (!_icon) {
        _icon = [[UIImageView alloc]initWithFrame:CGRectMake(MarginSize, MarginSize, CreatorBarHeight - MarginSize * 2, CreatorBarHeight - MarginSize * 2)];
        UIBezierPath * path = [UIBezierPath bezierPathWithRoundedRect:_icon.bounds cornerRadius:_icon.bounds.size.height/2];
        CAShapeLayer * layer = [CAShapeLayer layer];
        layer.path = path.CGPath;
        _icon.layer.mask = layer;
    }
    [self.contentView addSubview:_icon];
    return _icon;
}
-(UILabel *)name
{
    if (!_name) {
        _name = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(self.icon.frame) + MarginSize, MarginSize, K_SCREENWIDTH - MarginSize * 3 - 100, NameHeight)];
        _name.textColor = K_COLOR_TEXT_TITLE;
        _name.font = [UIFont systemFontOfSize:16];
    }
    [self.contentView addSubview:_name];
    return _name;
}
-(UILabel *)city
{
    if (!_city) {
        _city = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(self.icon.frame) + MarginSize, CGRectGetMaxY(self.name.frame), CGRectGetWidth(self.name.frame), CreatorBarHeight - NameHeight)];
        _city.textColor = K_COLOR_TEXT_BODY;
        _city.font = [UIFont systemFontOfSize:12];
    }
    [self.contentView addSubview:_city];
    return _city;
}

@end
