//
//  AudioHelper.h
//  BaiduVideo-iPad
//
//  Created by 飞飞 豆 on 12-10-20.
//  Copyright (c) 2012年 Baidu. All rights reserved.
//

#import <Foundation/Foundation.h>
#define headsetUnplugined @"headsetUnplugined"
#define headsetInstalled @"headsetInstalled"
@interface AudioHelper : NSObject
{  
    BOOL recording;  
}  
+ (void)addVolumeListener;
+ (BOOL)isHeadsetPluggedIn;

+ (void)setSysVolume:(float)aVolume;
+ (float)sysVolume;

- (void)initSession;  
- (BOOL)hasHeadset;  
- (BOOL)hasMicphone;  
- (void)cleanUpForEndRecording;  
- (BOOL)checkAndPrepareCategoryForRecording;
@end
