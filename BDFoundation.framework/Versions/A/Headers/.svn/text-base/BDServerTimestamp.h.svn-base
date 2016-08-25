//
//  BDDate.h
//  BDFoundation
//
//  Created by liujianjing on 14-5-28.
//
//

#import <Foundation/Foundation.h>

typedef void (^BDServerTimestampCompletion)(NSDate *date, NSError *error);

@interface BDServerTimestamp : NSObject

// 手机当前时间 - 服务器当前时间
@property(nonatomic, readonly)NSTimeInterval deltaInterval; // 获取不到服务器时间时，默认为0

+ (instancetype)sharedInstance;

/**
 * 获取服务器当前时间 实时
 */
- (void)getTimeStamp:(BDServerTimestampCompletion)completion;

/**
 * 获取服务器当前时间 非实时
 */
- (NSDate *)getTimeStampNotRefreshServer;

@end
