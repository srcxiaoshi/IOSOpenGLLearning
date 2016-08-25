//
//  FFmpegIOSViewController.m
//  test2
//
//  Created by baidu on 16/7/28.
//  Copyright © 2016年 baidu. All rights reserved.
//

#import "FFmpegIOSViewController.h"
#include <libavcodec/avcodec.h>
#include <libavformat/avformat.h>
#include <libavfilter/avfilter.h>

@interface FFmpegIOSViewController ()

@end

@implementation FFmpegIOSViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor=[UIColor whiteColor];
    
    
    //测试ffmpeg
    av_register_all();
    printf("%s",avcodec_configuration());
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
