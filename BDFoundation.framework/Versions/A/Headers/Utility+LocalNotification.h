//
//  Utility+LocalNotification.h
//  VideoIphone
//
//  Created by Wayne W on 14-7-17.
//  Copyright (c) 2014年 com.baidu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

extern NSString * const kLocalNotificationType;
extern NSString * const kLocalNotificationVideoID;
extern NSString * const kLocalNotificationVideoType;
extern NSString * const kLocalNotificationSource;
extern NSString * const kLocalNotificationTVStation;
extern NSString * const kLocalNotificationTVProgram;
extern NSString * const kLocalNotificationActionSource;

typedef BOOL (^UserInfoFilter_block_t)(NSDictionary *userInfo);

@protocol LocalNotificationHandler <NSObject>
- (void)handleLocalNotification:(UILocalNotification*)notify;
@end

@interface UILocalNotification (Utility)

+ (UILocalNotification*)scheduleLocalNotificationAt:(NSDate*)fireDate
                                               body:(NSString*)alertBody
                                               type:(NSString*)notify_type
                                           userInfo:(NSDictionary*)userInfo
                                         autoCancel:(BOOL)autoCancel
                                            handler:(Class)class4handler;

+ (UILocalNotification*)scheduleLocalNotificationAt:(NSDate*)fireDate
                                               body:(NSString*)alertBody                // 消息体
                                               type:(NSString*)notify_type
                                           userInfo:(NSDictionary*)userInfo
                                         autoCancel:(BOOL)autoCancel                    // 启动时是否自动cancel
                                        badgetCount:(int)badgetCount
                                          soundName:(NSString*)soundName
                                             repeat:(NSCalendarUnit)repeatInterval
                                            handler:(Class)class4handler;

+ (UILocalNotification*)scheduleLocalNotificationAt:(NSDate *)fireDate
                                               body:(NSString *)alertBody
                                               type:(NSString *)notify_type
                                           userInfo:(NSDictionary *)userInfo
                                         autoCancel:(BOOL)autoCancel
                                        badgetCount:(int)badgetCount
                                          soundName:(NSString *)soundName
                                             repeat:(NSCalendarUnit)repeatInterval
                                            handler:(Class)class4handler
                                           category:(NSString *)category;


+ (BOOL)handleLocalNotification:(UILocalNotification*)notif;        // 如果能处理，就返回YES

//返回已经schedule的通知，符合notify_type,并且filter返回YES
+ (UILocalNotification*)scheduledLocalNotificationWithType:(NSString*)notify_type
                                                    filter:(UserInfoFilter_block_t)filter;

// 获取某类型的所有本地通知
+ (NSArray*)scheduledLocalNotificationsWithType:(NSString*)notify_type;

// 判断一个本地通知是否已存在
+ (void)checkIfTheNotificationExists:(UILocalNotification*)notif completionBlock:(void (^)(BOOL exists))block;

+ (BOOL)cancelLocalNotification:(UILocalNotification*)notif;

+ (void)removeAutoCancelLocalNotifications;
+ (void)removeAllLocalNotificationsWithType:(NSString*)notify_type;

@end
