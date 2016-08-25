//
//  FeedBackView.m
//  test2
//
//  Created by baidu on 16/8/24.
//  Copyright © 2016年 baidu. All rights reserved.
//

#import "FeedBackView.h"
//#import <BDFoundation/NSStringEX.h>

#import "UIPlaceHolderTextView.h"
@interface FeedBackView()<UITableViewDelegate,UITableViewDataSource,UITextFieldDelegate, UITextViewDelegate,UIScrollViewDelegate>
@property (nonatomic,copy)NSArray *arr;
@property (nonatomic,strong) UIPlaceHolderTextView * contentTextView; //反馈内容
@property (nonatomic,strong) NSMutableArray *imgArr;
@end
@implementation FeedBackView

-(instancetype)initWithFrame:(CGRect)frame
{
    self=[super initWithFrame:frame];
    self.arr=@[@"无法播放",@"播放时崩溃",@"花屏/闪屏",@"音画不同步",@"其他"];
    self.imgArr=[NSMutableArray new];
    
    //写死了
    self.frame=CGRectMake(0, 0, MAX([UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height), MIN([UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height));
    self.backgroundColor=[UIColor redColor];
    
    
    UIView *feedView=[[UIView alloc] initWithFrame:CGRectMake((CGRectGetMaxX(self.frame)-320)/2.0, (CGRectGetMaxY(self.frame)-317)/2.0, 320, 317)];//放在屏幕中间
    feedView.backgroundColor =[self colorWithHexValue:0xe8ebee];
    feedView.alpha=1.0f;
    [self addSubview:feedView];
    
    //左上角image
    UIImageView *imgView=[[UIImageView alloc]initWithFrame:CGRectMake(10, 8.5, 28, 28)];
    imgView.backgroundColor=[UIColor clearColor];
    imgView.image=[UIImage imageNamed:@"Icon"];
    [feedView addSubview:imgView];
    
    //中间title
    UILabel *titleLabel=[[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(imgView.frame)+20,0, 18*7, 45)];
    titleLabel.backgroundColor = [UIColor clearColor];
    titleLabel.textColor = [self colorWithHexValue:0x444444];
    [titleLabel setFont:[UIFont boldSystemFontOfSize:18.0f]];
    titleLabel.text=@"播放错误反馈";
    [feedView addSubview:titleLabel];
    
    //线
    UIView *line=[[UIView alloc]initWithFrame:CGRectMake(0, 45, 320, 4)];
    line.backgroundColor=[self colorWithHexValue:0x218beb];
    [feedView addSubview:line];
    
    //中间一个tableView
    UITableView *tableView= [[UITableView alloc] initWithFrame:CGRectMake(20, 51, 280, 225) style:UITableViewStylePlain];
    tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    tableView.contentInset = UIEdgeInsetsMake(-32, 0,0, 0);//这里32是NavigationBar高度，这里注意下
    tableView.showsVerticalScrollIndicator = NO;
    tableView.dataSource = self;
    tableView.delegate = self;
    tableView.backgroundColor=[UIColor clearColor];
    [tableView setBackgroundColor:[self colorWithHexValue:0xfafafa]];
    [feedView insertSubview:tableView atIndex:0];
    
    //长线
    UIView *lineBto=[[UIView alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(tableView.frame), 320, 1)];
    lineBto.backgroundColor=[self colorWithHexValue:0xd2d4d6];
    [feedView addSubview:lineBto];
    
    
    //最下面的两个按钮
    UIButton *cancelBtn=[[UIButton alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(lineBto.frame), 160, 45)];
    cancelBtn.backgroundColor=[UIColor clearColor];
    [cancelBtn setTitle: @"取消" forState: UIControlStateNormal];
    [cancelBtn setTitleColor:[self colorWithHexValue:0x444444] forState:UIControlStateNormal];
    cancelBtn.titleLabel.font = [UIFont systemFontOfSize: 15.0];
    [cancelBtn setBackgroundColor: [UIColor clearColor]];
    [cancelBtn addTarget:self action:@selector(cancelEvent) forControlEvents:UIControlEventTouchUpInside];
    [feedView addSubview:cancelBtn];
    
    //按钮间的竖线
    UIView *shuLine=[[UIView alloc]initWithFrame:CGRectMake(160,CGRectGetMaxY(lineBto.frame), 1, 45)];
    shuLine.backgroundColor=[self colorWithHexValue:0xd2d4d6];
    [feedView addSubview:shuLine];
    
    UIButton *confirmBtn=[[UIButton alloc]initWithFrame:CGRectMake(160, CGRectGetMaxY(lineBto.frame), 160, 45)];
    confirmBtn.backgroundColor=[UIColor clearColor];
    [confirmBtn setTitle: @"发送反馈" forState: UIControlStateNormal];
    [confirmBtn setTitleColor:[self colorWithHexValue:0x444444] forState:UIControlStateNormal];
    confirmBtn.titleLabel.font = [UIFont systemFontOfSize: 15.0];
    [confirmBtn setBackgroundColor: [UIColor clearColor]];
    [confirmBtn addTarget:self action:@selector(confirmEvent) forControlEvents:UIControlEventTouchUpInside];
    [feedView addSubview:confirmBtn];

    return  self;
}

#pragma mark -- button event
//取消
-(void)cancelEvent
{
    if(!self.hidden)
    {
        self.hidden=YES;
    }
    NSLog(@"取消\n");
}

//发送反馈
-(void)confirmEvent
{
    NSLog(@"发送反馈\n");
}

#pragma mark -- table delegate & dataSource
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    CGFloat height =45;
    if (indexPath.row>=5) {
        height=45*4;
    }
    return height;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return  0.1f;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 0.1f;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 6;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"FeedBackItemCell";
    static NSString *ViewCellIdentifier = @"TextViewItemCell";
    if (indexPath.row<5) {
        UITableViewCell *cell = (UITableViewCell*)[tableView  dequeueReusableCellWithIdentifier:CellIdentifier];
        if(cell == nil)
        {
            cell =[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
            for (UIView * temp in cell.subviews) {
                [temp removeFromSuperview];
            }
            
            if (indexPath.row<5)
            {
                //左label
                UILabel *label=[[UILabel alloc]initWithFrame:CGRectMake(20, 0, 220, 45)];
                label.backgroundColor = [UIColor clearColor];
                label.textColor = [self colorWithHexValue:0x444444];
                [label setFont:[UIFont boldSystemFontOfSize:15.0f]];
                label.text=self.arr[indexPath.row];
                [cell addSubview:label];
                
                //右图
                UIImageView *imgView=[[UIImageView alloc]initWithFrame:CGRectMake(CGRectGetMaxX(label.frame), 12.5, 20, 20)];
                imgView.image=[UIImage imageNamed:@"sel_nor"];
                if (self.imgArr.count<=indexPath.row) {
                    [self.imgArr addObject:imgView];
                }
                else
                {
                    [self.imgArr replaceObjectAtIndex:indexPath.row withObject:imgView];
                }
                [cell addSubview:imgView];
                
                //线
                UIView *line=[[UIView alloc]initWithFrame:CGRectMake(0, 44, 280, 1)];
                line.backgroundColor=[self colorWithHexValue:0xd2d4d6];
                [cell addSubview:line];
            }

        }
        return cell;
    }
    else
    {
        
        
        UITableViewCell *cell = (UITableViewCell*)[tableView  dequeueReusableCellWithIdentifier:ViewCellIdentifier];
        if(cell == nil)
        {
            cell =[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ViewCellIdentifier];
            //输入框
            self.contentTextView= [[UIPlaceHolderTextView alloc] initWithFrame:CGRectMake(20, 2, 240, 40)];
            [self.contentTextView setFont:[UIFont systemFontOfSize:17]];
            self.contentTextView.backgroundColor = [UIColor whiteColor];
            self.contentTextView.layer.borderColor=[self colorWithHexValue:0xd2d4d6].CGColor;
            self.contentTextView.layer.borderWidth = 1;
            self.contentTextView.layer.cornerRadius = 6;
            self.contentTextView.layer.masksToBounds = YES;
            self.contentTextView.textColor = [self colorWithHexValue:0x353847];
            self.contentTextView.placeholderColor = [self colorWithHexValue:0xb8b9c1];
            [self.contentTextView setScrollEnabled:YES];
            [self.contentTextView setBounces:YES];
            [self.contentTextView setEditable:YES];
            [self.contentTextView setDelegate:self];
            self.contentTextView.placeholder = @"请留下您的宝贵意见~";
            self.contentTextView.autoresizingMask = UIViewAutoresizingFlexibleHeight;
            [cell addSubview:self.contentTextView];
        
            //线
            UIView *line=[[UIView alloc]initWithFrame:CGRectMake(0,45*4+2,tableView.frame.size.width, 1)];
            line.backgroundColor=[self colorWithHexValue:0xd2d4d6];
            [cell addSubview:line];
        }
        
        return cell;
            
    }
        
    
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    //暂时认为可以多选...?单选
    if (indexPath.row<5) {
        UIImageView *temp=self.imgArr[indexPath.row];
        temp.image=[UIImage imageNamed:@"sel_sel"];
    }
    
    if (indexPath.row==4) {
        [tableView setContentOffset:CGPointMake(0, 45*4) animated:YES];
    }
    
    NSLog(@"点击\n");
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    NSLog(@"---%f,%f\n",scrollView.contentOffset.x,scrollView.contentOffset.y);
}


#pragma keyboard
- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
    if (![self.contentTextView isExclusiveTouch]) {
        [self.contentTextView resignFirstResponder];
    }
}

#pragma private
-(UIColor *)colorWithHexValue:(NSUInteger)hexValue
{
    return [UIColor colorWithRed:((hexValue >> 16) & 0x000000FF)/255.0f
                           green:((hexValue >> 8) & 0x000000FF)/255.0f
                            blue:((hexValue) & 0x000000FF)/255.0
                           alpha:1.0];
}


@end
