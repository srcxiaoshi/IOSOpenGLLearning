//
//  NSObject+BDProperty.h
//  BDFoundation
//
//  Created by jiangliancheng on 15/11/16.
//
//

#import <Foundation/Foundation.h>
#import <objc/runtime.h>


/**
 *  category中声明id类型的属性，与ADD_OBJECT_PROPERTY配套使用
 *  @param type 属性的type，如NSString，UILabel
 *  @param name 属性的名字
 */
#define DYNAMIC_OBJECT(type,name)   @property (nonatomic, strong, setter=_lc_set##type##name:, getter=_lc_##type##name)type *name;

/**
 *  category中声明id类型的weak属性，与ADD_WEAK_OBJECT_PROPERTY配套使用
 *  @param type 属性的type，如NSString，UILabel
 *  @param name 属性的名字
 */
#define DYNAMIC_WEAK_OBJECT(type,name)   @property (nonatomic, weak, setter=_lc_set##type##name:, getter=_lc_##type##name)type *name;
/**
 *  category中声明基础类型的属性，与ADD_BASIC_PROPERTY配套使用
 *  @param type 属性的type，如：int，float,CGRect等
 *  @param name 属性的名字
 */
#define DYNAMIC_BASIC(type,name)      @property (nonatomic, assign, setter=_lc_set##type##name:, getter=_lc_##type##name)type name;

/**
 *  在category中添加id类型属性，一定要在+load方法中调用，与DYNAMIC_OBJECT配套使用
 *
 *  @param propertyType 属性的type，如NSString，UILabel
 *  @param name         属性的名字
 */
#define ADD_OBJECT_PROPERTY(propertyType,name) [self addObjectProperty:@__STRING(name) type:@__STRING(propertyType)];

/**
 *  在category中添加id类型属性，一定要在+load方法中调用，与DYNAMIC_WEAK_OBJECT配套使用
 *
 *  @param propertyType 属性的type，如NSString，UILabel
 *  @param name         属性的名字
 */
#define ADD_WEAK_OBJECT_PROPERTY(propertyType,name) [self addObjectProperty:@__STRING(name) type:@__STRING(propertyType) associationPolicy:OBJC_ASSOCIATION_ASSIGN];

/**
 *  在category中添加基础类型属性，一定要在+load方法中调用，与DYNAMIC_BASIC配套使用
 *  @param propertyType 属性的type，如：int，float,CGRect等
 *  @param name         属性的名字
 */
#define ADD_BASIC_PROPERTY(propertyType,name)    [self addBasicProperty:@__STRING(name) type:@__STRING(propertyType) encodingType:(@encode(propertyType))];

/**
 *   添加属性出现异常，异常信息会在reason中给出
 */
extern NSString *LcAddPropertyException;

@interface NSObject (LcProperty)

/**
 *  为类添加id类型的属性，objc_AssociationPolicy类型为OBJC_ASSOCIATION_RETAIN_NONATOMIC
 *  @param name 属性的name
 *  @param type 属性的type
 */
+ (void)addObjectProperty:(NSString *)name type:(NSString *)type;

/**
 *  为类添加id类型的属性
 *  @param name   属性的name
 *  @param type   属性的type，如NSString，NSArray
 *  @param policy 属性的policy
 */
+ (void)addObjectProperty:(NSString *)name type:(NSString *)type associationPolicy:(objc_AssociationPolicy)policy;

/**
 *  为类添加基础类型的属性，如：int,float,CGPoint,CGRect等
 *  @param name 属性的name
 *  @param type 属性的type，如@"int",@"float"
 *  @param encodeType 属性的encodingType，如@encode(int),@encode(float)
 */
+ (void)addBasicProperty:(NSString *)name type:(NSString *)type encodingType:(char *)encodeType;

@end