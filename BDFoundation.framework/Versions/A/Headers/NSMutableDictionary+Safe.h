//
//  NSMutableDictionary+Safe.h
//  BDFoundation
//
//  Created by Wayne W on 14-8-30.
//
//

#import <Foundation/Foundation.h>

@interface NSMutableDictionary (Safe)

- (void)safe_setObject:(id)anObject forKey:(id<NSCopying>)aKey;

- (void)safe_removeObjectForKey:(id<NSCopying>)key;

@end
