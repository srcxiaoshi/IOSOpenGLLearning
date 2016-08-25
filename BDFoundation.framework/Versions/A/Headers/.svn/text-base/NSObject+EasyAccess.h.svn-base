//
//  NSObject+EasyAccess.h
//  BaiduVideo-iPad
//
//  Created by 侯 甲 on 14-5-27.
//  Copyright (c) 2014年 Baidu. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 *@brief 从指定集合中获取指定类型数据的简易方法
 *@discussion 提供一些简单的逻辑，以便于从指定的数据集合中获取指定的数据类型。
 */
@interface NSObject (EasyAccess)

/**
 * 字典中获取字符串
 * @seealso easyType:forKey:
 * @note 非法后返回@"" 而非nil
 */
- (NSString *)easyStringForKey:(NSString *)key;

/**
 * 数组中获取字符串
 * @seealso easyType:forIndex:
 * @note 非法后返回@"" 而非nil
 */
- (NSString *)easyStringForIndex:(NSInteger)idx;

/**
 * 字典中获取指定类型的对象
 * @param key 字典KEY（暂不支持NSString外的类型）
 * @return 制定了类型对象或nil
 * @discussion 根据key从字典中获取指定类型对象，出现以下情况返回nil
 *      1.self 非字典；
 *      2.key 非NSString类型或是空串；
 *      3.return 非指定类型对象。
 */
- (id)easyType:(Class)clazz forKey:(NSString *)key;

/**
 * 数组中获取指定类型的对象
 * @param idx 数组下标
 * @return 指定类型对象或nil
 * @discussion 根据idx从数组中获取指定类型对象，出现以下情况返回nil
 *      1.self 非数组；
 *      2.idx 下标越界；
 *      3.return 非指定类型对象。
 */
- (id)easyType:(Class)clazz forIndex:(NSInteger)idx;

@end
