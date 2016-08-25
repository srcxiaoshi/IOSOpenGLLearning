//
//  AsyncFileWorker.h
//  VideoIphone
//
//  Created by wangwei34 on 13-7-25.
//  Copyright (c) 2013年 com.baidu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AsyncWorkItem.h"

extern NSString * const AsyncSerialWorkerItemCompletedNotification;
extern NSString * const AsyncSerialWorkerItemFailedNotification;
extern NSString * const kAsyncSerialWorkerItem;

@interface AsyncSerialWorker : NSObject

@property (nonatomic, assign) float threadPriority;

- (BOOL)enqueue:(id<AsyncWorkItem>)item;
- (void)cancel;

@end
