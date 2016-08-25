//
//  NSOperationQueue+Safe.h
//  BDFoundation
//
//  Created by wangwei34 on 15/6/17.
//
//

#import <Foundation/Foundation.h>

@interface NSOperationQueue (Safe)

//开启后，addOperation将自动去重，而非crash
+ (BOOL)enableSafeMode;

@end
