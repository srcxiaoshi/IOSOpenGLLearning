//
//  SharedLibCommon.h
//  VideoIphone
//
//  Created by wangwei34 on 13-5-16.
//  Copyright (c) 2013年 com.baidu. All rights reserved.
//

#ifndef VideoIphone_SharedLibCommon_h
#define VideoIphone_SharedLibCommon_h


#define IOS7_AVAILABLE (SYSTEM_VERSION >= 7.0) //运行时判断系统iOS版本是否为7.0以上
#if __IPHONE_OS_VERSION_MAX_ALLOWED >= 70000   //编译时，有使用iOS7的方法需要用 (#ifdef IOS7_SDK_AVAILABLE  #endif) 判断
#define IOS7_SDK_AVAILABLE 1
#endif

#define DEVICE_IS_IPAD()        (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
#define DEVICE_IS_IPHONE()      (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone)

#import <Foundation/Foundation.h>
#import "ObjCRuntimeExt.h"

#define SharedLibInst           ([SharedLib sharedInstance])
#define SYSTEM_VERSION          ([[SharedLib sharedInstance] iosVersion])
#define SYSTEM_VERSION_STRING   ([[SharedLib sharedInstance] systemVersionString])

// NOTE: 表示基于哪个平台开发（iPhone/iPad/tvOS/watchOS/等），与具体产品无关。
// e.g.: 百度视频iPhone，百度影音iPhone，
//       都是基于iPhone平台开发，所以都应该配置为 PLATFORM_TYPE_IPHONE_VIDEO；
//       二者如有差异，应该写在各自app的工程里（通过扩展、配置、参数等等），不应用此参数区分。
typedef enum
{
    PLATFORM_TYPE_UNKNOWN           = 0,
    PLATFORM_TYPE_IPHONE_VIDEO,
    PLATFORM_TYPE_IPAD_VIDEO,
    PLATFORM_TYPE_TVOS_VIDEO,
    PLATFORM_TYPE_WATCHOS_VIDEO,
    
    // more?
    
    PLATFORM_TYPE_MAX,
    
    // legacy
    PROJECT_TYPE_UNKNOWN            = PLATFORM_TYPE_UNKNOWN,
    PROJECT_TYPE_IPHONE_VIDEO       = PLATFORM_TYPE_IPHONE_VIDEO,
    PROJECT_TYPE_IPAD_VIDEO         = PLATFORM_TYPE_IPAD_VIDEO,
    
}PLATFORM_TYPE;
#define PROJECT_TYPE    PLATFORM_TYPE
extern PLATFORM_TYPE g_platformType;

// helper macro
#define IS_IPAD_APP_PROJECT()       ([SharedLibInst platformType] == PLATFORM_TYPE_IPAD_VIDEO)
// each project must set its project type in main.m, by default it's PLATFORM_TYPE_IPHONE_VIDEO
#define SET_PROJECT_TYPE_TO(type)   (g_platformType = (type))

// device type
typedef enum
{
    DEVICE_TYPE_UNKNOWN     = 0,
    
    DEVICE_TYPE_IPHONE      = 0x01,
    DEVICE_TYPE_IPAD        = 0x02,
    DEVICE_TYPE_IPOD        = 0x04,
    
    // more?
    
    DEVICE_TYPE_SIMULATOR   = 0x8000000,
    DEVICE_TYPE_SIM_IPHONE  = (DEVICE_TYPE_SIMULATOR | DEVICE_TYPE_IPHONE),
    DEVICE_TYPE_SIM_IPAD    = (DEVICE_TYPE_SIMULATOR | DEVICE_TYPE_IPAD),
    DEVICE_TYPE_SIM_IPOD    = (DEVICE_TYPE_SIMULATOR | DEVICE_TYPE_IPOD),
    
    // more?
    
    DEVICE_TYPE_MAX,
    
    // special cases
    DEVICE_TYPE_DEFAULT     = DEVICE_TYPE_IPHONE,   // by default, it's iPhone
    
}DEVICE_TYPE;

// HELPER MACRO FOR DEVICE_TYPE
#define MODEL_IS_IPHONE        (([SharedLibInst deviceType] & DEVICE_TYPE_IPHONE)      != 0)
#define MODEL_IS_IPAD          (([SharedLibInst deviceType] & DEVICE_TYPE_IPAD)        != 0)
#define MODEL_IS_IPOD          (([SharedLibInst deviceType] & DEVICE_TYPE_IPOD)        != 0)
#define MODEL_IS_SIMULATOR     (([SharedLibInst deviceType] & DEVICE_TYPE_SIMULATOR)   != 0)


@interface SharedLib : NSObject

- (NSString*)userAgent;             // VideoiPhone, VideoiPad
- (NSDictionary*)dictUserAgent;
- (NSString *)appDisplayName;
- (NSString*)appVersion;            // short version, e.g. 6.4.1
- (NSString*)buildVersion;          // build version, e.g. 6.4.1.1
- (PROJECT_TYPE)projectType;        // same as platformType
- (NSString *)systemVersionString;
- (float)iosVersion;
- (NSString*)appWorktype;           // like iphnative, ipdnative, pbiphnative, ...
- (PLATFORM_TYPE)platformType;      // the type of platform while compile/link

// implement implIsJailBrokenIPA in different project
- (BOOL)isJailBrokenIPA;
// different project implements its own channelID
- (NSString*)channelID;

- (DEVICE_TYPE)deviceType;          // the device type
- (NSString*)deviceName;            // the model name without any space, e.g. iPhone, iPod_Simulator, ..
- (NSString*)deviceDisplayName;     // the display-name of model, e.g. iPod, iPad Simulator, ...
- (NSString*)hardwareName;          // e.g. iPhone 3G, iPad 2
-(NSString*)getTerminalNameFromProjectType; //iphone ipad

+ (SharedLib*)sharedInstance;

-(NSString*)projectId;

/**
 *  nsclick 用的pid。
 *  @return 视频iphone:185, 视频ipad:188，影音iPhone：202，影音ipad：203
 */
- (NSString *)pid;

/*  iphnative(pbiphnative),ipdnative(pbipdnative),
 *  iphmonative(pbiphmonative),ipdmonative(phipdmonative) 
 */
-(NSString*)appWorktype:(BOOL)ignoreJailBroken;

-(NSString*)formatConfigData:(NSArray*)keys format:(NSString*)format;

@end

////////////////////////////////////////////////////////////////////////////////
// category should implement these methods,
// different project may have different implementation
@interface SharedLib (Ext)
- (BOOL)implIsJailBrokenIPA;
- (NSString*)implChannelID;
@end

#endif
