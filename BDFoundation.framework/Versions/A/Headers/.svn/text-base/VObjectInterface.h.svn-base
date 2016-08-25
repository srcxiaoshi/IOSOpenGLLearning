//
//  VObjectInterface.h
//  BaiduVideo-iPad
//
//  Created by shituanwei on 12-11-9.
//  Copyright (c) 2012年 Baidu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WMCache.h"
#import "MKNetworkEngine.h"
#import "MKNetworkOperation.h"
#import "VEngine.h"

@interface VObjectInterface : NSObject


@property (nonatomic,retain) VEngine *engine;
@property (nonatomic,strong) MKNetworkOperation *netoperator;
@property (nonatomic,strong) WMCache *wmcache;
@property (nonatomic,assign) BOOL   cache_on;
@property (nonatomic,strong) NSString *cacheid;

-(id)initWithEngine:(VEngine *)_engine;
-(void) cancel;
-(void) cleanNetOperation;


@end
