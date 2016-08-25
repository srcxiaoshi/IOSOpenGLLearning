//
//  NSString_IsEmpty.h
//  BDFoundation
//
//  Created by HouJia on 14-11-3.
//
//

#import "NSStringEX.h"

// evaluate whether a string is empty.
#define __isStrNotEmpty(string) (   string                                  \
                                 && ![string isEqual:[NSNull null]]         \
                                 && [string isKindOfClass:[NSString class]] \
                                 && ![string isEqualToString:@"(null)"]     \
                                 && [string trim].length)
#define __isStrEmpty(string) !(__isStrNotEmpty(string))