//
//  WMIndexEngine.h
//  ComplexProject
//
//  Created by shituanwei on 12-11-6.
//  Copyright (c) 2012年 shituanwei. All rights reserved.
//

#import "MKNetworkEngine.h"
#import "WMCache.h"

@interface VEngine : MKNetworkEngine

@end

/** 用于请求成功的block中操作缓存   */
@interface BDCacheManager : NSObject

/** 表示是否将这次请求结果缓存，默认是YES*/
@property (nonatomic, assign)BOOL saveCache;

/** 用于清理缓存，包括历史中的缓存和这次的缓存*/
- (void)clearCurrentRequestCache;
@end

/**
 *  网络请求成功的block
 *  @param successOperation 对应的MKNetworkOperation
 *  @param isCache          数据是否是缓存中的数据，YES表示缓存，NO表示是新请求回来的数据
 *  @param cacheManager     操作cache的Manager，若不需要保持这次缓存，设置cacheManager.saveCache=NO，必要时候也可以调用clearCurrentRequestCache
 *  @param jsonString       请求返回的json
 */
typedef void (^BDRequestSuccessBlock)(MKNetworkOperation *operation, BOOL isCache, BDCacheManager *cacheManager, NSString *jsonString);
typedef void (^BDRequestFailureBlock)(MKNetworkOperation *operation, NSError *error);

@interface VEngine(Request)

- (MKNetworkOperation *)GET:(NSString *)path
                     params:(NSDictionary*)params
                    success:(BDRequestSuccessBlock)success
                    failure:(BDRequestFailureBlock)failure;

- (MKNetworkOperation *)POST:(NSString *)path
                      params:(NSDictionary*)params
                     success:(BDRequestSuccessBlock)success
                     failure:(BDRequestFailureBlock)failure;

-(MKNetworkOperation*)requestWithPath:(NSString*)path
                               params:(NSDictionary*)params
                           httpMethod:(NSString*)method
                  requireVersionParam:(BOOL)isRequire
                              success:(BDRequestSuccessBlock)success
                              failure:(BDRequestFailureBlock)failure;

-(MKNetworkOperation*)requestWithPath:(NSString*)path
                               params:(NSDictionary*)params
                           httpMethod:(NSString*)method
                  requireVersionParam:(BOOL)isRequire
                             useCache:(BOOL)useCache
                          mustRequest:(BOOL)isMust
                              success:(BDRequestSuccessBlock)success
                              failure:(BDRequestFailureBlock)failure;

/**
 *  封装的调用网络请求的方法
 *
 *  @param path      请求的path
 *  @param params    请求所带的参数
 *  @param method    请求的方法，包括@"GET",@"POST"...
 *  @param isRequire 是否需要附带的Version等参数，附带的Version等参数在-extRequestBody:工程中设置
 *  @param useCache  是否使用缓存
 *  @param cache     用于设置缓存的路径，过期时间等，如果为nil，会设置为默认的路径和过期时间
 *  @param isMust    使用缓存时，如果有缓存，是否还需要继续请求。不使用缓存，这个参数无用
 *  @param success   请求成功之后的block，block中可以区分是否是缓存，以及对缓存进行操作，详情见block的解释
 *  @param failure   请求失败后的block回调
 *
 *  @return 请求生成的operation
 */
-(MKNetworkOperation*)requestWithPath:(NSString*)path
                               params:(NSDictionary*)params
                           httpMethod:(NSString*)method
                  requireVersionParam:(BOOL)isRequire
                             useCache:(BOOL)useCache
                              WMCache:(WMCache*)cache
                          mustRequest:(BOOL)isMust
                              success:(BDRequestSuccessBlock)success
                              failure:(BDRequestFailureBlock)failure;

/**
 *  封装的调用网络请求的方法
 *
 *  @param path      请求的path
 *  @param params    请求所带的参数
 *  @param method    请求的方法，包括@"GET",@"POST"...
 *  @param isRequire 是否需要附带的Version等参数，附带的Version等参数在-extRequestBody:工程中设置
 *  @param useCache  是否使用缓存
 *  @param cache     用于设置缓存的路径，过期时间等，如果为nil，会设置为默认的路径和过期时间
 *  @param isMust    使用缓存时，如果有缓存，是否还需要继续请求。不使用缓存，这个参数无用
 *  @param cookies   需要设置的cookie字典，例如 key1:val1   key2:val2
 *  @param success   请求成功之后的block，block中可以区分是否是缓存，以及对缓存进行操作，详情见block的解释
 *  @param failure   请求失败后的block回调
 *
 *  @return 请求生成的operation
 */
-(MKNetworkOperation*)requestWithPath:(NSString*)path
                               params:(NSDictionary*)params
                           httpMethod:(NSString*)method
                  requireVersionParam:(BOOL)isRequire
                             useCache:(BOOL)useCache
                              WMCache:(WMCache*)cache
                          mustRequest:(BOOL)isMust
                              cookies:(NSDictionary*)cookies
                              success:(BDRequestSuccessBlock)success
                              failure:(BDRequestFailureBlock)failure;

@end
