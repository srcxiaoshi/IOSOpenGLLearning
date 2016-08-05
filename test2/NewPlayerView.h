//
//  NewPlayerView.h
//  test2
//
//  Created by baidu on 16/7/6.
//  Copyright © 2016年 baidu. All rights reserved.
//

#import <UIKit/UIKit.h>

@class AVPlayer;

@interface NewPlayerView : UIView

@property (nonatomic, strong) AVPlayer *player;
// to reload the AVPlayer
- (instancetype)initWithFrame:(CGRect)frame;
-(void)play;
-(void)pause;
@end
