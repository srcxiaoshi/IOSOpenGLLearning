//
//  OrderDictionary.h
//  BDFoundation
//
//  Created by yuhaoran on 13-11-18.
//
//  此类不支持使用initWithObjectsAndKeys方法，只能使用- (void)setObject:(id)anObject forKey:方法添加

#import <Foundation/Foundation.h>

@interface OrderDictionary : NSMutableDictionary
{
    NSMutableDictionary *dictionary;
    
    //添加的元素的key值保存在keysArr中，按此顺序遍历
    NSMutableArray *keysArr;
}

@end



