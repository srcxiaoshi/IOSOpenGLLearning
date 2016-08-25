//
//  DataProfileBase.h
//  BaiduVideo-iPad
//
//  Created by wangwei34 on 13-5-23.
//  Copyright (c) 2013年 Baidu. All rights reserved.
//

#import <Foundation/Foundation.h>
@interface DataProfileBase : NSObject

+ (NSString*)readFromDataProfile4key:(NSString*)key defaultValue:(NSString*)defVal;

+ (id)readFromDataProfile4key:(NSString*)key;

@end
