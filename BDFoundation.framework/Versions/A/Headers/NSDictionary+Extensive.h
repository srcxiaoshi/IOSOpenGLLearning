//
//  NSDictionary+Extensive.h
//  BDFoundation
//
//  Created by jiangliancheng on 15/1/20.
//
//

#import <Foundation/Foundation.h>

@interface NSDictionary(extensive)

/**
 *  通过传入的keys，获取对应的key和value，组成NSDictionary并返回
 *  若传入的key所对应的value为nil，则不添加到要返回的NSDictionary中
 *
 *  @param keys 一个包含key的数组
 *
 *  @return 返回一个包含对应key和value的NSDictionary
 */
- (NSMutableDictionary *)dictionaryWithOptionalValuesForKeys:(NSArray *)keys;

@end
