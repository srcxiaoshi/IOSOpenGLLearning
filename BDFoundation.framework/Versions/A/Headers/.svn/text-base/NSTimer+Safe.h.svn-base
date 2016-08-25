//
//  NSTimer+Safe.h
//  BDFoundation
//
//  Created by wangwei34 on 14-12-16.
//
//

#import <Foundation/Foundation.h>

@interface NSTimer (Safe)

+ (NSTimer *)safe_scheduledTimerWithTimeInterval:(NSTimeInterval)ti
                                          target:(id)aTarget            // weak reference, avoid crash bug
                                        selector:(SEL)aSelector
                                        userInfo:(id)userInfo
                                         repeats:(BOOL)yesOrNo
                             disableIfBackground:(BOOL)disableIfBackground;

- (int)tickSum;     // 累计总次数

@end
