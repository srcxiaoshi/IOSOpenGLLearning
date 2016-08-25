//
//  BDDecrypt.h
//  BDFoundation
//
//  Created by yuhaoran on 15-3-5.
//
//

#import <Foundation/Foundation.h>

@interface BDDecrypt : NSObject

+ (NSString*)decryptWithInput:(NSString*)inputStr sign:(NSString*)sign;

@end
