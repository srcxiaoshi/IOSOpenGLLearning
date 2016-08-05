//
//  TableWithPlayerViewController.m
//  test2
//
//  Created by baidu on 16/8/5.
//  Copyright © 2016年 baidu. All rights reserved.
//

#import "TableWithPlayerViewController.h"
#import "NewPlayerView.h"
#import <AVFoundation/AVFoundation.h>


@interface TableWithPlayerViewController ()<UITableViewDelegate,UITableViewDataSource>

@property(nonatomic,strong)UITableView *tableView;
@property(nonatomic,strong)NSMutableArray *listPlayerView;
@property(nonatomic,strong)NSMutableArray *listPlayerItem;
@end

@implementation TableWithPlayerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.tableView=[[UITableView alloc]initWithFrame:CGRectMake(0,0, [UIScreen mainScreen].bounds.size.width,[UIScreen mainScreen].bounds.size.height) style:UITableViewStylePlain];
    self.tableView.dataSource=self;
    self.tableView.delegate=self;
    [self.view addSubview:self.tableView];
    self.listPlayerView=[NSMutableArray new];
    
    self.listPlayerItem=[NSMutableArray new];
    NSURL *url=[[NSURL alloc]initWithString:@"http://static.tripbe.com/videofiles/20121214/9533522808.f4v.mp4"];
    for (int i=0;i<10; i++) {
        NewPlayerView *tempPlayer =[[NewPlayerView alloc]initWithFrame:CGRectMake(0,0,[[UIScreen mainScreen] bounds].size.width , [[UIScreen mainScreen] bounds].size.height-64)];
        [self.listPlayerView addObject:tempPlayer];
        
        AVPlayerItem *tempItem =[[AVPlayerItem alloc]initWithURL:url];
        [((NewPlayerView *)[self.listPlayerView objectAtIndex:i]).player replaceCurrentItemWithPlayerItem:tempItem];
        [self.listPlayerItem addObject:tempItem];
    }
}
#pragma mark UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    //随意
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *TableSampleIdentifier = @"TableSampleIdentifier";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:
                             TableSampleIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]
                initWithStyle:UITableViewCellStyleDefault
                reuseIdentifier:TableSampleIdentifier];
    }
    //声明一个播放器
    //测试视频播放  avplayer
    
    
    NSURL *url=[[NSURL alloc]initWithString:@"http://static.tripbe.com/videofiles/20121214/9533522808.f4v.mp4"];
    if (![self.listPlayerView objectAtIndex:indexPath.row]) {
        NewPlayerView *tempPlayer =[[NewPlayerView alloc]initWithFrame:CGRectMake(0,0,[[UIScreen mainScreen] bounds].size.width , [[UIScreen mainScreen] bounds].size.height-64)];
        [self.listPlayerView addObject:tempPlayer];
    }
    
    if (![self.listPlayerItem objectAtIndex:indexPath.row]) {
        AVPlayerItem *tempItem =[[AVPlayerItem alloc]initWithURL:url];
        [((NewPlayerView *)[self.listPlayerView objectAtIndex:indexPath.row]).player replaceCurrentItemWithPlayerItem:tempItem];
        [self.listPlayerItem addObject:tempItem];
    }
    
    
    
    [cell addSubview:[self.listPlayerView objectAtIndex:indexPath.row]];
    
    cell.frame=CGRectMake(0,0,[[UIScreen mainScreen] bounds].size.width , [[UIScreen mainScreen] bounds].size.height-64);
    
    return cell;
}

#pragma mark UITableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NewPlayerView *tempView=[self.listPlayerView objectAtIndex:indexPath.row];
    [tempView.player play];
    NSLog(@"点了\n");
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return [[UIScreen mainScreen] bounds].size.height-64;
}
- (void)tableView:(UITableView *)tableView didEndDisplayingCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath*)indexPath
{
    NewPlayerView *tempView=[self.listPlayerView objectAtIndex:indexPath.row];
    [tempView.player pause];
    NSLog(@"结束\n");
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
