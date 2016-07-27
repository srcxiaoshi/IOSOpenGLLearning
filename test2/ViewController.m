//
//  ViewController.m
//  test2
//
//  Created by baidu on 16/6/30.
//  Copyright © 2016年 baidu. All rights reserved.
//

#import "ViewController.h"
#import "secondViewController.h"
#import "NewPlayerView.h"
#import <AVFoundation/AVFoundation.h>
#import <CoreVideo/CVPixelBuffer.h>


@interface ViewController ()<AVPlayerItemOutputPullDelegate>
@property(nonatomic,strong)NewPlayerView *playerView;
@property(nonatomic,strong)AVPlayerItem * playItem;
@property(nonatomic,strong)AVPlayerItemVideoOutput *videoOutput;
@property(nonatomic,strong)dispatch_queue_t myVideoOutputQueue;
@property(nonatomic,assign)int count;
@property(nonatomic,strong)UIButton *btn;
@property(nonatomic,strong)UIImageView *imageView;

@property(nonatomic,assign) CGPoint begin;
@property(nonatomic,strong) UIWindow *window;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    NSString *newPath=[[NSBundle mainBundle] pathForResource:@"9533522808.f4v.mp4" ofType:@""];
//    
//    [self.view setBackgroundColor:[UIColor redColor]];
//    
//    NSURL *url = [[NSURL alloc]initWithString:[NSString stringWithFormat:@"file:///%@",newPath]];
//    NSLog(@"url=%@\n",url);
    NSURL *url=[[NSURL alloc]initWithString:@"http://static.tripbe.com/videofiles/20121214/9533522808.f4v.mp4"];
    self.playerView=[[NewPlayerView alloc]initWithFillMode:@""];
    
    self.playItem=[[AVPlayerItem alloc]initWithURL:url];
    [_playItem addObserver:self forKeyPath:@"status" options:NSKeyValueObservingOptionNew context:nil];
    [_playItem addObserver:self forKeyPath:@"loadedTimeRanges" options:NSKeyValueObservingOptionNew context:nil];
    [self.playerView.player replaceCurrentItemWithPlayerItem:_playItem];
    self.playerView.layer.frame=CGRectMake(0, 0, 180, 100);
    
    
    //设置videoOutPut
    NSDictionary *pixBuffAttributes = @{(id)kCVPixelBufferPixelFormatTypeKey: @(kCVPixelFormatType_32RGBA)};//这里注意kCVPixelFormatType_32RGBA格式，不是所有的都能显示在UIImageView中的
    self.videoOutput = [[AVPlayerItemVideoOutput alloc] initWithPixelBufferAttributes:pixBuffAttributes];
    _myVideoOutputQueue = dispatch_queue_create("myVideoOutputQueue", DISPATCH_QUEUE_SERIAL);
    [[self videoOutput] setDelegate:self queue:_myVideoOutputQueue];
    
    [self.playerView.player play];
    [self.view addSubview:self.playerView];
    //下面这句很重要
    [self.playItem addOutput:self.videoOutput];
    
    self.count=0;
    
}
-(void)clict
{
    
}
-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSString *,id> *)change context:(void *)context
{
    if([keyPath isEqualToString:@"status"])
    {
        AVPlayerStatus status=[[change objectForKey:@"new"] intValue];
        //NSLog(@"status=%ld\n",(long)status);
        if (status==AVPlayerStatusReadyToPlay) {
            NSLog(@"ready\n");
        }
    }
    else if ([keyPath isEqualToString:@"loadedTimeRanges"])
    {
        NSArray* arr=[change objectForKey:@"new"];
        //NSLog(@"time=%@\n",arr);
    }
    
    
    CMTime outputItemTime = kCMTimeInvalid;
    
    // Calculate the nextVsync time which is when the screen will be refreshed next.
    CFTimeInterval nextVSync = (CACurrentMediaTime() + 0);//0.016667可以是0
    outputItemTime = [[self videoOutput] itemTimeForHostTime:nextVSync];
    if ([[self videoOutput] hasNewPixelBufferForItemTime:outputItemTime]) {
        CVPixelBufferRef pixelBuffer = NULL;
        pixelBuffer = [[self videoOutput] copyPixelBufferForItemTime:outputItemTime itemTimeForDisplay:NULL];
        size_t width=CVPixelBufferGetWidth(pixelBuffer);
        size_t hight=CVPixelBufferGetHeight(pixelBuffer);
        NSLog(@"---------%zu,%zu\n",width,hight);
        if (pixelBuffer != NULL) {
            CFRelease(pixelBuffer);
        }
    }
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - 视图控制器的触摸事件
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    NSLog(@"start\n");
    UITouch *touch=[touches anyObject];
    UIWindow *tt=[touch window];
    //取得当前位置
    self.begin=[[touches anyObject] locationInView:self.view];
    //双击事件
    if(touch.tapCount>1)
    {
        NSLog(@"dddddddddddddddddddd\n");
        if (_count%2==0) {
            tt.frame=CGRectMake(tt.frame.origin.x, tt.frame.origin.y, 270, 150);
            _count++;
        }
        else
        {
            tt.frame=CGRectMake(tt.frame.origin.x, tt.frame.origin.y, 180, 100);
            _count++;
        }
    }
    self.playerView.frame=CGRectMake(0, 0, tt.frame.size.width, tt.frame.size.height);
}

-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event{
    //取得一个触摸对象（对于多点触摸可能有多个对象）
    UITouch *touch=[touches anyObject];
    UIWindow *tt=[touch window];
    //取得前一个位置
    CGPoint nowPoint=[touch locationInView:self.view];
    //坐标转换
    tt.frame=CGRectMake(tt.frame.origin.x+nowPoint.x-self.begin.x, tt.frame.origin.y+nowPoint.y-self.begin.y, tt.frame.size.width, tt.frame.size.height);
    NSLog(@"moving\n");
    
}

-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event{
    NSLog(@"end\n");
}

-(void)dealloc
{
    [self.playItem removeObserver:self forKeyPath:@"status" context:nil];
    [self.playItem removeObserver:self forKeyPath:@"loadedTimeRanges" context:nil];
}
@end
