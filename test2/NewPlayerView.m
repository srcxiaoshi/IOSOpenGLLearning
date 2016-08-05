//
//  NewPlayerView.m
//  test2
//
//  Created by baidu on 16/7/6.
//  Copyright © 2016年 baidu. All rights reserved.
//

#import "NewPlayerView.h"
#import <AVFoundation/AVFoundation.h>

@interface NewPlayerView()

//是否正在播放
@property(nonatomic,assign)BOOL isPlay;

//是否是大窗
@property(nonatomic,assign)BOOL isBigWindow;

@end



@implementation NewPlayerView
#pragma mark 重写set get 方法
+ (Class)layerClass {
    return [AVPlayerLayer class];
}

- (AVPlayer *)player {
    return [(AVPlayerLayer *)[self layer] player];
}

- (void)setPlayer:(AVPlayer *)player {
    [(AVPlayerLayer *)[self layer] setPlayer:player];
}


#pragma arguments
- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame])
    {
        if (!self.player) {
            self.player=[[AVPlayer alloc]init];
        }
        //设置播放页面的大小
        self.layer.frame =frame;
        self.layer.backgroundColor = [UIColor blackColor].CGColor;
        //设置播放窗口和当前视图之间的比例显示内容
        ((AVPlayerLayer*)self.layer).videoGravity = AVLayerVideoGravityResizeAspect;
        //设置播放的默认音量值
        self.player.volume = 1.0f;
        
        //
        self.isPlay=NO;
        self.isBigWindow=NO;
        //tap手势
        self.userInteractionEnabled = YES;
        
        UITapGestureRecognizer *tapGesture=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(event:)];
        [self addGestureRecognizer:tapGesture];
    }
    return self;
}
//点击事件
-(void)event:(UITapGestureRecognizer *)gesture
{
    NSLog(@"gg=%lu",(unsigned long)gesture.numberOfTouches);
    if(gesture.numberOfTouches>1)//双击，多击事件
    {
        NSLog(@"双击\n");
        if (self.isBigWindow) {
            self.frame=CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.width);
        }
        else
        {
            self.frame=CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height);
        }
        
    }
    else  //单击
    {
        if (self.isPlay) {
            [self pause];
        }
        else
        {
            [self play];
        }
    }
    
}
-(void)play
{
    [self.player play];
    self.isPlay=YES;
}
-(void)pause
{
    [self.player pause];
    self.isPlay=NO;
}
@end
