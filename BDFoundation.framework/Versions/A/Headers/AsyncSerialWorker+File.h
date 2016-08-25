//
//  AsyncSerialWorker+File.h
//  VideoIphone
//
//  Created by wangwei34 on 13-7-26.
//  Copyright (c) 2013年 com.baidu. All rights reserved.
//

#import "AsyncSerialWorker.h"
#import "AsyncFileWorkItem.h"

// 帮助类，专注串行写文件
@interface AsyncSerialWorker (File)

- (AsyncFileWorkItem*)write2filePath:(NSString*)path data:(NSData*)data userInfo:(NSDictionary*)userInfo;

@end
