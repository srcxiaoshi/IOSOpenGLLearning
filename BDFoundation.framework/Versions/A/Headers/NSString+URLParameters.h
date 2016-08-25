//
//  NSString+URLParameters.h
//  VideoIphone
//
//  Created by wangwei34 on 13-10-28.
//  Copyright (c) 2013年 com.baidu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (URLParameters)

- (NSString*)stringByAppendedURLParams:(NSDictionary*)params keyList:(NSArray*)keyList;
- (NSDictionary*)parseURlForQuery;
- (NSDictionary*)parseQuery;

@end
