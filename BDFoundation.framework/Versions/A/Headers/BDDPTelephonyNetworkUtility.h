//
//  TelephonyNetworkUtility.h
//  BDDNSProxy4iOS
//
//  Created by HouJia on 15/7/15.
//
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(int, MobileBandType) {
    MobileBandTypeUnknow        =   0,
    MobileBandTypeChinaMobile   =   1,  ///< 移动
    MobileBandTypeChinaUnicom   =   2,  ///< 联通
    MobileBandTypeChinaTelecom  =   3,  ///< 电信
    MobileBandTypeChinaTietong  =   4,  ///< 铁通
};

@interface BDDPTelephonyNetworkUtility : NSObject

+ (MobileBandType)mobileBandType;

+ (BOOL)checkChinaMobile;
+ (BOOL)checkChinaUnicom;
+ (BOOL)checkChinaTelecom;
+ (BOOL)checkChinaTietong;

@end
