//
//  NSString+EasyStringDrawing.h
//  BDFoundation
//
//  Created by HouJia on 16/3/9.
//
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface NSString (EasyStringDrawing)

- (CGSize)easy_sizeWithFont:(UIFont *)font;
- (CGSize)easy_sizeWithFont:(UIFont *)font forWidth:(CGFloat)width lineBreakMode:(NSLineBreakMode)lineBreakMode;
- (CGSize)easy_sizeWithFont:(UIFont *)font constrainedToSize:(CGSize)size lineBreakMode:(NSLineBreakMode)lineBreakMode;
- (CGSize)easy_sizeWithFont:(UIFont *)font constrainedToSize:(CGSize)size;

- (void)easy_drawInRect:(CGRect)rect withFont:(UIFont *)font;
- (void)easy_drawInRect:(CGRect)rect withFont:(UIFont *)font lineBreakMode:(NSLineBreakMode)lineBreakMode;
- (void)easy_drawInRect:(CGRect)rect withFont:(UIFont *)font lineBreakMode:(NSLineBreakMode)lineBreakMode alignment:(NSTextAlignment)alignment;

@end
