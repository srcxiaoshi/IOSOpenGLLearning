//
//  AirplayService.h
//  VideoIphone
//
//  Created by lewis on 14-5-14.
//  Copyright (c) 2014年 com.baidu. All rights reserved.
//

#import <Foundation/Foundation.h>

extern NSString * const kNotificationAirplayRouteChanged;
extern NSString * const kAirPlayName;
extern NSString * const kAirPlayUID;

@interface AirplayService : NSObject
+ (id)shareInstance;
-(void)registerAirplayListener;
-(BOOL) isAirPlayActive;
@end
