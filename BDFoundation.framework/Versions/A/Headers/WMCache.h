//
//  WMCache.h
//  WMCache
//  Latest Modify：2012年11月19日00:02:27
//  2012年11月19日00:03:15：加入了setCache检查目录功能
//  Created by shituanwei on 12-11-9.
//  Copyright (c) 2012年 com.wmCorp. All rights reserved.
//
#import <Foundation/Foundation.h>
#import "FileHelper.h"
//配置的cache默认路径
#define DEFAULT_CACHE_PATH @"tmp/WMCache/"

//配置默认的cache失效时间
#define DEFAULT_EXPIRE_TIME (60*60*24*3)

@interface WMCache : NSObject
{
@protected
    NSString * cachePath;
    NSInteger expireTime;
}

//@property(nonatomic,strong) NSString * cachePath;
//@property(nonatomic,assign) NSInteger expireTime;



/**
 *	@brief	初始化cache，path为cache路径，此路径是在Documents的后续部分，比如Documents/Cache
 *          path只需要传递@"Documents/Cache" 默认是拼接在getAppRootPath后面
 *
 *	@return	返回初始化后的实例
 */
-(id)initWithPath:(NSString *) path;


/**
 *	@brief	根据配置的初始路径进行初始化
 *
 *	@return	return instance of cache
 */
-(id)init;

-(BOOL) setCache:(NSData *)value
                forKey:(NSString *)key;

/**
 *	@brief	设置Cache中的key->value
 *
 *	@param 	key 	key
 *	@param 	value 	value
 *
 *	@return	success:YES;fail:NO;
 */
-(BOOL) setCacheString:(NSString *)value
          forKey:(NSString *)key;


-(BOOL) setCacheData:(NSData *)value
              forKey:(NSString *)key;
/**
 *	@brief	get data by key from cache instance
 *
 *	@return	return the value by key
 */
-(NSData *) getCacheData:(NSString *) key;

-(NSString *) getCacheString:(NSString *) key;

/**
 *	@brief	empty the cache in cache dictionary
 */
-(void) clear;

/**
 *	@brief	clear one of the item by key
 *
 *	@return	if success:YES;fail:NO
 */
-(BOOL) clearItem:(NSString *) key;

/**
 *	@brief	设置过期时间
 */
-(void) setExpireTime:(NSInteger) time;


/**
 *	@brief	判断Cache目录中是否存在某项
 *
 *	@return	判断结果
 */
-(BOOL) isExist:(NSString *) key;
@end
